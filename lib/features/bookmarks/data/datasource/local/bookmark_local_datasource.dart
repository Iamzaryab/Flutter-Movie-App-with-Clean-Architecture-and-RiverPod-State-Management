import 'package:dartz/dartz.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

abstract class BookmarkLocalDataSource {
  Future<Either<AppException, List<MovieDetail>>> getBookMarkMovies();
  Future<void> removeBookMark(MovieDetail movieDetail);
}
