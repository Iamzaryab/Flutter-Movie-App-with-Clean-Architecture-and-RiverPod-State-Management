import 'package:dartz/dartz.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_and_cache_movies.dart';
import 'package:filmku/features/home/domain/use_cases/fetch_cached_movies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/home/presentation/providers/state/movie_state.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/shared/util/app_exception.dart';

class MovieNotifier extends StateNotifier<MovieState> {
  final FetchAndCacheMovies _fetchAndCacheMovies =
      injector.get<FetchAndCacheMovies>();
  final FetchCachedMovies _fetchCachedMovies =
      injector.get<FetchCachedMovies>();

  MovieNotifier() : super(const MovieState.initial());

  bool get isFetching =>
      state.state != MoviesConcreteState.loading &&
      state.state != MoviesConcreteState.fetchingMore;

  Future<void> getMovies({required String type}) async {
    if (state.state == MoviesConcreteState.initial) {
      final movies = await _fetchCachedMovies.execute(type: type);
      updateStateFromGetMoviesResponse(movies);
    }
    if (isFetching && state.state != MoviesConcreteState.fetchedAllMovies) {
      state = state.copyWith(
        state: state.page > 0
            ? MoviesConcreteState.fetchingMore
            : MoviesConcreteState.loading,
        isLoading: true,
      );
      final movies = await _fetchAndCacheMovies.execute(page: state.page + 1, type: type);
      updateStateFromGetMoviesResponse(movies);
    } else {
      state = state.copyWith(
          state: MoviesConcreteState.fetchedAllMovies,
          message: 'No more movies left',
          isLoading: false);
    }
  }

  void updateStateFromGetMoviesResponse(Either<AppException, Movies> response) {
    response.fold((failure) {
      state = state.copyWith(
          state: MoviesConcreteState.failure,
          message: failure.message,
          isLoading: false);
    }, (movies) {
      if (state.cache && !movies.cached) {
        state = state.copyWith(movies: []);
      }
      final totalMovies = [...state.movies, ...movies.movies];
      state = state.copyWith(
          movies: totalMovies,
          state: totalMovies.length == movies.totalResults
              ? MoviesConcreteState.fetchedAllMovies
              : MoviesConcreteState.loaded,
          hasData: true,
          cache: movies.cached,
          message: totalMovies.isEmpty ? 'No Movies Found' : '',
          page: movies.page,
          totalPages: movies.totalPages,
          isLoading: false);
    });
  }

  void resetState() {
    state = const MovieState.initial();
  }
}
