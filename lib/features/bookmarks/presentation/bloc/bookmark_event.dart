
part of 'bookmark_bloc.dart';
sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object?> get props => [];
}

final class GetBookmarksEvent extends BookmarkEvent {
  const GetBookmarksEvent();
}

final class RemoveBookmarkEvent extends BookmarkEvent {
  final MovieDetail movieDetail;
  const RemoveBookmarkEvent({required this.movieDetail});
}
