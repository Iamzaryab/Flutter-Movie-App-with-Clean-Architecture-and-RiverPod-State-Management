import 'package:filmku/features/movie_detail/data/datasource/local/movie_detail_local_datasource.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/local/cache/local_db.dart';
import 'package:isar/isar.dart';

class MovieDetailLocalDataSourceImpl extends MovieDetailLocalDataSource {
  LocalDb localDb;

  MovieDetailLocalDataSourceImpl({required this.localDb});

  @override
  Future<int> bookmarkMovie(MovieDetail movieDetail) async {
    await localDb.getDb().writeTxn(() async {
      localDb.getDb().movieDetails.put(movieDetail);
      await localDb.getDb().notificationModels.put(NotificationModel(title: movieDetail.title, message: 'Successfully added Bookmark',positive: true));
    });
    return 1;
  }

  @override
  Future<bool> removeBookmark(MovieDetail movieDetail) async {
    return await localDb.getDb().writeTxn(()async {
       final value= await localDb.getDb().movieDetails.filter().idEqualTo(movieDetail.id).findFirst();
       await localDb.getDb().notificationModels.put(NotificationModel(title: movieDetail.title, message: 'Successfully removed Bookmark',positive: false));
       return await localDb.getDb().movieDetails.delete(value!.isarId);

    });
  }

  @override
  Future<bool> isBookmarked(int id) async {
    final response = await localDb
        .getDb()
        .movieDetails
        .filter()
        .idEqualTo(id)
        .findFirst();
    if (response == null) {
      return false;
    } else {
      return true;
    }
  }
}
