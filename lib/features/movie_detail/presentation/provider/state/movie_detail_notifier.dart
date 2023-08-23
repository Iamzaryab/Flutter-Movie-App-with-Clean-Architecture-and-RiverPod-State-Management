import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:filmku/features/movie_detail/presentation/provider/state/movie_detail_state.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

class MovieDetailNotifier extends StateNotifier<MovieDetailState> {
  final MovieDetailRepository movieDetailRepository =
      injector.get<MovieDetailRepository>();

  MovieDetailNotifier()
      : super(const MovieDetailState(movieDetail: MovieDetail()));



  bool get isFetching => state.state != MovieDetailConcreteState.loading;

  Future<void> bookmarkMovieDetail(MovieDetail movieDetail) async {
    final response =
        await movieDetailRepository.bookmarkMovieDetail(movieDetail);
    state = state.copyWith(isBookmarked: true);
  }

  Future<void> removeBookmark(MovieDetail movieDetail) async {
    final response = await movieDetailRepository.removeBookmark(movieDetail);
    state = state.copyWith(isBookmarked: false);
  }

  Future<void> checkIfBookMarked(int id) async {
    final isBookmarked = await movieDetailRepository.isBookmarked(id);
    state = state.copyWith(isBookmarked: isBookmarked);
  }

  Future<void> getMovie({required int id}) async {
    if (isFetching) {
      state = state.copyWith(
        state: MovieDetailConcreteState.loading,
        isLoading: true,
      );
      final response = await movieDetailRepository.getMovie(
          id: id);
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
