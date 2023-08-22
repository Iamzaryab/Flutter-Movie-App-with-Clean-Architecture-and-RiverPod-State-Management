import 'package:dartz/dartz.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';

abstract class HomeRepository {
  Future<Either<AppException, Movies>> fetchCachedMovies({required String type});
  Future<Either<AppException, Movies>> fetchAndCacheMovies({required int page, required String type});
  Future<Either<AppException, Genres>> fetchCachedGenres();
  Future<Either<AppException, Genres>> fetchAndCacheGenres();
}
