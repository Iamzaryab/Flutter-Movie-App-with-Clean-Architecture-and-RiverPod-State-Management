import 'package:dartz/dartz.dart';
import 'package:filmku/features/bookmarks/data/datasource/local/bookmark_local_datasource.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/local/cache/local_db.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:isar/isar.dart';

class BookmarkLocalDataSourceImpl extends BookmarkLocalDataSource {
  LocalDb localDb;

  BookmarkLocalDataSourceImpl({required this.localDb});

  @override
  Future<Either<AppException, List<MovieDetail>>> getBookMarkMovies() async {
    final movies = await localDb.getDb().movieDetails.where().findAll();
    if (movies.isEmpty) {
      return Left(AppException(
          message: 'No Bookmark available',
          statusCode: 0,
          identifier: 'bookmark',
          which: 'local'));
    } else {
      return Right(movies);
    }
  }

  @override
  Future<void> removeBookMark(MovieDetail movieDetail) async {
    await localDb.getDb().writeTxn(() async{
      await localDb.getDb().movieDetails.delete(movieDetail.isarId);
      await localDb.getDb().notificationModels.put(NotificationModel(title: movieDetail.title, message: 'Successfully removed Bookmark', positive: false));
    });
  }
}
