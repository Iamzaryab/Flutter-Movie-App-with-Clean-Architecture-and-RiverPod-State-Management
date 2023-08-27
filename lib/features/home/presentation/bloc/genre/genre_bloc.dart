import 'package:dartz/dartz.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_and_cache_genre_use_case.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_cached_genre_use_case.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:filmku/features/home/presentation/bloc/genre/genre_state.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final FetchCacheGenresUseCase _fetchCacheGenre = injector.get<FetchCacheGenresUseCase>();
  final FetchAndCacheGenreUseCase _fetchAndCacheGenre =
      injector.get<FetchAndCacheGenreUseCase>();

  GenreBloc() : super(const GenreState.initial()) {
    on<GetGenreLocalEvent>(_getGenreLocal);
    on<GetGenreRemoteEvent>(_getGenreRemote);
  }
  bool get isFetching => state.state !=GenreConcreteState.loading;

  Future<void> _getGenreLocal(GetGenreLocalEvent event, Emitter<GenreState> emit) async {

    if (isFetching) {
      emit(state.copyWith(
        state: GenreConcreteState.loading,
        isLoading: true,
      ));
      final cached = await _fetchCacheGenre.execute();
      cached.fold((failure)  {
        emit(state.copyWith(
          state: GenreConcreteState.failure,
          isLoading: false,
        ));
        add(const GetGenreRemoteEvent());
      }, (success) {
        updateStateFromGenreResponse(cached, emit);
      });
    }
  }
  Future<void> _getGenreRemote(GetGenreRemoteEvent event, Emitter<GenreState> emit) async {

    if (isFetching) {
      emit(state.copyWith(
        state: GenreConcreteState.loading,
        isLoading: true,
      ));
      final response = await _fetchAndCacheGenre.execute();
      updateStateFromGenreResponse(response, emit);
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
