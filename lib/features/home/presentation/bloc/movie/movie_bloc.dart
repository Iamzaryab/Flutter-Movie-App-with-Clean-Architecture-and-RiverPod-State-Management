import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_and_cache_movies.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_cached_movies.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/models/movie.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_event.dart';

part 'movie_state.dart';

sealed class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final FetchAndCacheMovies _fetchAndCacheMovies =
  injector.get<FetchAndCacheMovies>();
  final FetchCachedMovies _fetchCachedMovies =
  injector.get<FetchCachedMovies>();

  bool get isFetching =>
      state.state != MoviesConcreteState.loading &&
          state.state != MoviesConcreteState.fetchingMore;

  MovieBloc() : super(const MovieState.initial()) {
    on<GetMoviesEvent>(getMovies);
  }

  Future<void> getMovies(GetMoviesEvent event, Emitter<MovieState> emit) async {
    if (state.state == MoviesConcreteState.initial) {
      final movies = await _fetchCachedMovies.execute(type: event.type);
      updateStateFromGetMoviesResponse(movies, emit);
    }

    if (isFetching && state.state != MoviesConcreteState.fetchedAllMovies) {
      emit(
          state.copyWith(
            state: state.page > 0
                ? MoviesConcreteState.fetchingMore
                : MoviesConcreteState.loading,
            isLoading: true,
          )
      );
      final movies = await _fetchAndCacheMovies.execute(
          page: state.page + 1, type: event.type);
      updateStateFromGetMoviesResponse(movies, emit);
    } else {
      emit(
          state.copyWith(
              state: MoviesConcreteState.fetchedAllMovies,
              message: 'No more movies left',
              isLoading: false)
      );
    }
  }

  void updateStateFromGetMoviesResponse(Either<AppException, Movies> response,
      Emitter<MovieState> emit) {
    response.fold((failure) {
      emit(state.copyWith(
          state: MoviesConcreteState.failure,
          message: failure.message,
          isLoading: false));
    }, (movies) {
      if (state.cache && !movies.cached) {
        emit(state.copyWith(movies: []));
      }
      final totalMovies = [...state.movies, ...movies.movies];
      emit(state.copyWith(
          movies: totalMovies,
          state: totalMovies.length == movies.totalResults
              ? MoviesConcreteState.fetchedAllMovies
              : MoviesConcreteState.loaded,
          hasData: true,
          cache: movies.cached,
          message: totalMovies.isEmpty ? 'No Movies Found' : '',
          page: movies.page,
          totalPages: movies.totalPages,
          isLoading: false));
    });
  }
}

final class GetNowShowingMovieBloc extends MovieBloc{
  GetNowShowingMovieBloc();
}
final class GetPopularMovieBloc extends MovieBloc{
  GetPopularMovieBloc();
}
