part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

final class GetMovieDetailEvent extends MovieDetailEvent {
  final int movieId;
  const GetMovieDetailEvent({required this.movieId});
}

final class AddBookmarkEvent extends MovieDetailEvent {
  final MovieDetail movieDetail;

  const AddBookmarkEvent({required this.movieDetail});
}
final class IsBookmarkedEvent extends MovieDetailEvent {
  final int movieId;

  const IsBookmarkedEvent({required this.movieId});
}

final class RemoveBookmarkEvent extends MovieDetailEvent {
  final MovieDetail movieDetail;

  const RemoveBookmarkEvent({required this.movieDetail});
}