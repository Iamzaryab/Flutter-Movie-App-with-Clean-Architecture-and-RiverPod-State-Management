import 'package:equatable/equatable.dart';

import 'package:filmku/models/movie.dart';

enum MoviesConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllMovies,
}

class MovieState extends Equatable {
  final List<Movie> movies;
  final int page;
  final int totalPages;
  final int totalResults;
  final bool hasData;
  final MoviesConcreteState state;
  final String message;
  final bool isLoading;
  final bool cache;

  const MovieState({
    this.movies = const [],
    this.page = 0,
    this.totalPages = 0,
    this.totalResults = 0,
    this.hasData = false,
    this.state = MoviesConcreteState.initial,
    this.message = '',
    this.isLoading = false,
    this.cache = false,
  });

  const MovieState.initial({
    this.movies = const [],
    this.page = 0,
    this.totalPages = 0,
    this.totalResults = 0,
    this.hasData = false,
    this.state = MoviesConcreteState.initial,
    this.message = '',
    this.isLoading = false,
    this.cache = false,
  });

  MovieState copyWith({
    List<Movie>? movies,
    int? page,
    int? totalPages,
    int? totalResults,
    bool? hasData,
    MoviesConcreteState? state,
    String? message,
    bool? isLoading,
    bool? cache,
  }) {
    return MovieState(
        movies: movies ?? this.movies,
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
        hasData: hasData ?? this.hasData,
        state: state ?? this.state,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        cache: cache ?? this.cache);
  }


  @override
  String toString() {
    return 'MovieState{movies: $movies, page: $page, totalPages: $totalPages, totalResults: $totalResults, hasData: $hasData, state: $state, message: $message, isLoading: $isLoading, cache: $cache}';
  }

  @override
  List<Object?> get props => [movies, page, state, hasData, message,cache];
}
