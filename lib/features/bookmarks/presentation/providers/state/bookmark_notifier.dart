import 'package:dartz/dartz.dart';
import 'package:filmku/di/injector.dart';
import 'package:filmku/features/bookmarks/domain/use_cases/get_bookmarks_use_case.dart';
import 'package:filmku/features/bookmarks/presentation/providers/state/bookmark_state.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../movie_detail/domain/use_cases/remove_bookmark_use_case.dart';

class BookmarkNotifier extends StateNotifier<BookmarkState> {
  final GetBookmarksUseCase _getBookmarkUseCase =
      injector.get<GetBookmarksUseCase>();
  final RemoveBookmarkUseCase _removeBookmarkUseCase =
      injector.get<RemoveBookmarkUseCase>();

  BookmarkNotifier() : super(const BookmarkState.initial());

  bool get isFetching => state.state != BookmarkConcreteState.loading;

  Future<void> getBookmarks() async {
    if (isFetching) {
      state = state.copyWith(
        state: BookmarkConcreteState.loading,
        isLoading: true,
      );
      final bookmarks = await _getBookmarkUseCase.execute();
      updateStateFromBookmarksResponse(bookmarks);
    }
  }

  void removeBookmark(MovieDetail movieDetail) {
    _removeBookmarkUseCase.execute(movieDetail);
    final bookmarks = state.bookmarks;
    bookmarks.remove(movieDetail);
    state = state.copyWith(
        bookmarks: bookmarks,
        hasData: bookmarks.isEmpty ? false : true,
        state: bookmarks.isEmpty
            ? BookmarkConcreteState.failure
            : BookmarkConcreteState.loaded);
  }

  void updateStateFromBookmarksResponse(
      Either<AppException, List<MovieDetail>> bookmarks) {
    bookmarks.fold((failure) {
      state = state.copyWith(
        state: BookmarkConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (success) {
      state = state.copyWith(
          bookmarks: success,
          message: '',
          hasData: true,
          isLoading: false,
          state: BookmarkConcreteState.loaded);
    });
  }

  void resetState() {
    state = const BookmarkState.initial();
  }
}
