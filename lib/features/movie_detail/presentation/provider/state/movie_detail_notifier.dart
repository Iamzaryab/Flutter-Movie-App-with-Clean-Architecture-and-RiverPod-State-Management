import 'package:dartz/dartz.dart';
import 'package:filmku/di/injector.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/add_bookmark_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/get_movie_details_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/is_bookmark_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/remove_bookmark_use_case.dart';
import 'package:filmku/features/movie_detail/presentation/provider/state/movie_detail_state.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailNotifier extends StateNotifier<MovieDetailState> {
  final AddBookmarkUseCase _addBookmarkUseCase =
      injector.get<AddBookmarkUseCase>();
  final RemoveBookmarkUseCase _removeBookmarkUseCase =
      injector.get<RemoveBookmarkUseCase>();
  final GetMovieDetailsUseCase _getMovieDetailsUseCase =
      injector.get<GetMovieDetailsUseCase>();
  final IsBookmarkedUseCase _isBookmarkedUseCase =
      injector.get<IsBookmarkedUseCase>();

  MovieDetailNotifier()
      : super(const MovieDetailState(movieDetail: MovieDetail()));

  bool get isFetching => state.state != MovieDetailConcreteState.loading;

  Future<void> bookmarkMovieDetail(MovieDetail movieDetail) async {
    await _addBookmarkUseCase.execute(movieDetail);
    state = state.copyWith(isBookmarked: true);
  }

  Future<void> removeBookmark(MovieDetail movieDetail) async {
    await _removeBookmarkUseCase.execute(movieDetail);
    state = state.copyWith(isBookmarked: false);
  }

  Future<void> checkIfBookMarked(int id) async {
    final isBookmarked = await _isBookmarkedUseCase.execute(id);
    state = state.copyWith(isBookmarked: isBookmarked);
  }

  Future<void> getMovie({required int id}) async {
    if (isFetching) {
      state = state.copyWith(
        state: MovieDetailConcreteState.loading,
        isLoading: true,
      );
      final response = await _getMovieDetailsUseCase.execute(movieId: id);
      updateStateFromMovieResponse(response);
    }
  }

  void updateStateFromMovieResponse(
      Either<AppException, MovieDetail> response) {
    response.fold((failure) {
      state = state.copyWith(
          state: MovieDetailConcreteState.failure,
          message: failure.message,
          hasData: false,
          isLoading: false);
    }, (success) {
      state = state.copyWith(
        state: MovieDetailConcreteState.loaded,
        movieDetail: success,
        hasData: true,
        isLoading: false,
        message: '',
      );
    });
  }

  void resetState() {
    state = const MovieDetailState.initial(movieDetail: MovieDetail());
  }
}
