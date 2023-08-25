import 'package:dartz/dartz.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_and_cache_genre.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_cached_genre.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_state.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final FetchCacheGenres _fetchCacheGenre = injector.get<FetchCacheGenres>();
  final FetchAndCacheGenre _fetchAndCacheGenre =
      injector.get<FetchAndCacheGenre>();

  GenreBloc() : super(const GenreState.initial()) {
    on<GenreEvent>(getGenres);
  }
  bool get isFetching => state.state !=GenreConcreteState.loading;

  Future<void> getGenres(GenreEvent event, Emitter<GenreState> emit) async {

    if (isFetching) {
      emit(state.copyWith(
        state: GenreConcreteState.loading,
        isLoading: true,
      ));
      final cached = await _fetchCacheGenre.execute();
      cached.fold((failure) async {
        emit(state.copyWith(isLoading: true));
        final response = await _fetchAndCacheGenre.execute();
        updateStateFromGenreResponse(response, emit);
      }, (success) {
        updateStateFromGenreResponse(cached, emit);
      });
    }
  }

  void updateStateFromGenreResponse(
      Either<AppException, Genres> response, emit) {
    response.fold((failure) {
      emit(state.copyWith(
          state: GenreConcreteState.failure,
          message: failure.message,
          isLoading: false));
    }, (success) {
      emit(state.copyWith(
          genres: success.genres,
          hasData: true,
          message: success.genres.isEmpty ? 'No genre found' : '',
          isLoading: false,
          state: GenreConcreteState.loaded));
    });
  }
}
