import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'local_db.dart';


class InitDbImpl extends LocalDb {
  late Isar db;

  @override
  Future<void> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open(
      [MoviesSchema, GenresSchema, MovieDetailSchema, NotificationModelSchema],
      directory: dir.path,
    );
  }

  @override
  Isar getDb() {
    return db;
  }

  @override
  Future<void> cleanDb() async {
    await db.writeTxn(() => cleanDb());
  }
}
