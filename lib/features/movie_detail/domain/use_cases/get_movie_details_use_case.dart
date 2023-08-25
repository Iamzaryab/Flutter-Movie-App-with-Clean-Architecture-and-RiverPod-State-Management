import 'package:dartz/dartz.dart';
import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

class GetMovieDetailsUseCase {
  final MovieDetailRepository movieDetailRepository;

  GetMovieDetailsUseCase({required this.movieDetailRepository});

  Future<Either<AppException, MovieDetail>> execute(
      {required int movieId}) async {
    return movieDetailRepository.getMovie(id: movieId);
  }
}
