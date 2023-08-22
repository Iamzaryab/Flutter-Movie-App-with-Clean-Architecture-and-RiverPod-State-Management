import 'package:dartz/dartz.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

abstract class BookmarkRepository {
  Future<Either<AppException, List<MovieDetail>>> getBookmarks();

  Future<void> removeBookmark(MovieDetail movieDetail);
}
