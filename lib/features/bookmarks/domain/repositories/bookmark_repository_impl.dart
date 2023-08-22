import 'package:dartz/dartz.dart';
import 'package:filmku/features/bookmarks/data/datasource/local/bookmark_local_datasource.dart';
import 'package:filmku/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  BookmarkLocalDataSource bookmarkLocalDataSource;

  BookmarkRepositoryImpl({required this.bookmarkLocalDataSource});

  @override
  Future<Either<AppException, List<MovieDetail>>> getBookmarks() {
    return bookmarkLocalDataSource.getBookMarkMovies();
  }

  @override
  Future<void> removeBookmark(MovieDetail movieDetail) {
    return bookmarkLocalDataSource.removeBookMark(movieDetail);
  }
}
