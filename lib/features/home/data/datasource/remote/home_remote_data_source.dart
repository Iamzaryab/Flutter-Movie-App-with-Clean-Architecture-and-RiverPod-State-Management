import 'package:dartz/dartz.dart';
import 'package:filmku/models/response/genre_response.dart';
import 'package:filmku/models/response/movies_response.dart';
import 'package:filmku/shared/util/app_exception.dart';

abstract class HomeRemoteDataSource {
  Future<Either<AppException, MoviesResponse>> getMovies(
      {required String endPoint, required int page});

  Future<Either<AppException, GenreResponse>> getGenre();
}
