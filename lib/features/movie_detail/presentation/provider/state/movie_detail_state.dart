import 'package:equatable/equatable.dart';
import 'package:filmku/models/movie_detail.dart';

enum MovieDetailConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class MovieDetailState extends Equatable {
  final int id;
  final MovieDetail movieDetail;
  final bool isBookmarked;
  final bool hasData;
  final String message;
  final bool isLoading;
  final MovieDetailConcreteState state;

  const MovieDetailState(
      {this.id = 0,
      required this.movieDetail,
      this.isBookmarked = false,
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.state = MovieDetailConcreteState.initial});

  const MovieDetailState.initial(
      {this.id = 0,
      required this.movieDetail,
      this.isBookmarked = false,
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.state = MovieDetailConcreteState.initial});

  MovieDetailState copyWith({
    int? id,
    MovieDetail? movieDetail,
    bool? hasData,
    String? message,
    bool? isLoading,
    MovieDetailConcreteState? state,
    bool? isBookmarked,
  }) {
    return MovieDetailState(
        id: id ?? this.id,
        movieDetail: movieDetail ?? this.movieDetail,
        hasData: hasData ?? this.hasData,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        state: state ?? this.state);
  }

  @override
  List<Object?> get props =>
      [id, movieDetail, hasData, message, isLoading, state, isBookmarked];
}
