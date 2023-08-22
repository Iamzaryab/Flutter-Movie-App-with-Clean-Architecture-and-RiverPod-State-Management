import 'package:equatable/equatable.dart';
import 'package:filmku/models/movie_detail.dart';

enum BookmarkConcreteState { initial, loading, loaded, failure }

class BookmarkState extends Equatable {
  final List<MovieDetail> bookmarks;
  final bool hasData;
  final String message;
  final BookmarkConcreteState state;
  final bool isLoading;

  const BookmarkState(
      {this.bookmarks = const [],
        this.hasData = false,
        this.message = '',
        this.state = BookmarkConcreteState.initial,
        this.isLoading = false});

  const BookmarkState.initial(
      {this.bookmarks = const [],
        this.hasData = false,
        this.message = '',
        this.state = BookmarkConcreteState.initial,
        this.isLoading = false});

  BookmarkState copyWith(
      {List<MovieDetail>? bookmarks,
        bool? hasData,
        String? message,
        BookmarkConcreteState? state,
        bool? isLoading}) {
    return BookmarkState(
        bookmarks: bookmarks ?? this.bookmarks,
        message: message ?? this.message,
        hasData: hasData ?? this.hasData,
        state: state ?? this.state,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [bookmarks, hasData, message, state, isLoading];
}
