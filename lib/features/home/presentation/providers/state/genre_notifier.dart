import 'package:dartz/dartz.dart';
import 'package:filmku/di/injector.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_and_cache_genre_use_case.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_cached_genre_use_case.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'genre_state.dart';

class GenreNotifier extends StateNotifier<GenreState> {
  // final HomeRepository homeRepository = injector.get<HomeRepository>();

  final FetchAndCacheGenreUseCase _fetchAndCacheGenreUseCase =
      injector.get<FetchAndCacheGenreUseCase>();
  final FetchCacheGenresUseCase _fetchCacheGenresUseCase =
      injector.get<FetchCacheGenresUseCase>();

  GenreNotifier() : super(const GenreState.initial());

  bool get isFetching => state.state != GenreConcreteState.loading;

  Future<void> getGenres() async {
    if (isFetching) {
      state = state.copyWith(
        state: GenreConcreteState.loading,
        isLoading: true,
      );
      final cached = await _fetchCacheGenresUseCase.execute();
      cached.fold((failure) async {
        state = state.copyWith(isLoading: true);
        final response = await _fetchAndCacheGenreUseCase.execute();
        updateStateFromGenreResponse(response);
      }, (success) {
        updateStateFromGenreResponse(cached);
      });
    }
  }

  void updateStateFromGenreResponse(Either<AppException, Genres> response) {
    response.fold((failure) {
      state = state.copyWith(
          state: GenreConcreteState.failure,
          message: failure.message,
          isLoading: false);
    }, (success) {
      state = state.copyWith(
          genres: success.genres,
          hasData: true,
          message: success.genres.isEmpty ? 'No genre found' : '',
          isLoading: false,
          state: GenreConcreteState.loaded);
    });
  }

  void resetState() {
    state = const GenreState.initial();
  }
}
