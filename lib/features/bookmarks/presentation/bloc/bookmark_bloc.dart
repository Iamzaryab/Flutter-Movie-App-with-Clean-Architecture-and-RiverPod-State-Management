import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/bookmarks/domain/use_cases/get_bookmarks_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/remove_bookmark_use_case.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetBookmarksUseCase _getBookmarksUseCase = injector.get<GetBookmarksUseCase>();
  final RemoveBookmarkUseCase _removeBookmarkUseCase = injector.get<RemoveBookmarkUseCase>();

  BookmarkBloc() : super(const BookmarkState.initial()) {
    on<GetBookmarksEvent>(_getBookmarks);
    on<RemoveBookmarkEvent>(_removeBookmark);
  }

  bool get isFetching => state.state != BookmarkConcreteState.loading;

  Future<void> _getBookmarks(
      GetBookmarksEvent event, Emitter<BookmarkState> emit) async {
    if (isFetching) {
      emit(state.copyWith(
        state: BookmarkConcreteState.loading,
        isLoading: true,
      ));
      final bookmarks = await _getBookmarksUseCase.execute();
      updateStateFromBookmarksResponse(bookmarks, emit);
    }
  }

  void _removeBookmark(RemoveBookmarkEvent event, Emitter<BookmarkState> emit) {
    _removeBookmarkUseCase.execute(event.movieDetail);
    final bookmarks = state.bookmarks;
    bookmarks.remove(event.movieDetail);
    emit(state.copyWith(
        bookmarks: bookmarks,
        hasData: bookmarks.isEmpty ? false : true,
        state: bookmarks.isEmpty
            ? BookmarkConcreteState.failure
            : BookmarkConcreteState.loaded));
  }

  void updateStateFromBookmarksResponse(
      Either<AppException, List<MovieDetail>> bookmarks,
      Emitter<BookmarkState> emit) {
    bookmarks.fold((failure) {
      emit(state.copyWith(
        state: BookmarkConcreteState.failure,
        message: failure.message,
        isLoading: false,
      ));
    }, (success) {
      emit(state.copyWith(
          bookmarks: success,
          message: '',
          hasData: true,
          isLoading: false,
          state: BookmarkConcreteState.loaded));
    });
  }
}
