import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/add_bookmark_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/get_movie_details_use_case.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/is_bookmark_use_case.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmku/features/movie_detail/domain/use_cases/remove_bookmark_use_case.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final AddBookmarkUseCase _addBookmarkUseCase = injector.get<AddBookmarkUseCase>();
  final GetMovieDetailsUseCase _getMovieDetailsUseCase =
      injector.get<GetMovieDetailsUseCase>();
  final IsBookmarkedUseCase _isBookmarkedUseCase = injector.get<IsBookmarkedUseCase>();
  final RemoveBookmarkUseCase _removeBookmarkUseCase = injector.get<RemoveBookmarkUseCase>();

  MovieDetailBloc()
      : super(const MovieDetailState.initial(movieDetail: MovieDetail())) {
    on<AddBookmarkEvent>(addBookmark);
    on<RemoveBookmarkEvent>(removeBookmark);
    on<GetMovieDetailEvent>(getMovieDetails);
    on<IsBookmarkedEvent>(checkIfBookmarked);
  }

  bool get isFetching => state.state != MovieDetailConcreteState.loading;

  Future<void> addBookmark(
      AddBookmarkEvent event, Emitter<MovieDetailState> emit) async {
    final response = await _addBookmarkUseCase.execute(event.movieDetail);
    emit(state.copyWith(isBookmarked: true));
  }

  Future<void> removeBookmark(
      RemoveBookmarkEvent event, Emitter<MovieDetailState> emit) async {
    final response = await _removeBookmarkUseCase.execute(event.movieDetail);
    emit(state.copyWith(isBookmarked: false));
  }

  Future<void> checkIfBookmarked(
      IsBookmarkedEvent event, Emitter<MovieDetailState> emit) async {
    final isBookmarked = await _isBookmarkedUseCase.execute(event.movieId);
    emit(state.copyWith(isBookmarked: isBookmarked));
  }

  Future<void> getMovieDetails(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    if (isFetching) {
      emit(state.copyWith(
        state: MovieDetailConcreteState.loading,
        isLoading: true,
      ));
      final response =
          await _getMovieDetailsUseCase.execute(movieId: event.movieId);
      updateStateFromMovieResponse(response, emit);
    }
  }

  void updateStateFromMovieResponse(Either<AppException, MovieDetail> response,
      Emitter<MovieDetailState> emit) {
    response.fold((failure) {
      emit(state.copyWith(
          state: MovieDetailConcreteState.failure,
          message: failure.message,
          hasData: false,
          isLoading: false));
    }, (success) {
      emit(state.copyWith(
        state: MovieDetailConcreteState.loaded,
        movieDetail: success,
        hasData: true,
        isLoading: false,
        message: '',
      ));
    });
  }
}
