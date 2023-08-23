import 'package:dartz/dartz.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:isar/isar.dart';

import 'package:filmku/shared/local/cache/local_db.dart';
import 'home_local_datasource.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  LocalDb localDb;

  HomeLocalDataSourceImpl({required this.localDb});

  @override
  Future<void> cacheMovies({required Movies movies}) async {
    await localDb.getDb().writeTxn(() async {
      final cached = await localDb
          .getDb()
          .movies
          .filter()
          .typeEqualTo(movies.type)
          .pageEqualTo(movies.page)
          .findFirst();
      if (cached == null) {
        await localDb.getDb().movies.put(movies);
      } else {
        await localDb.getDb().movies.put(movies.copyWith(id: cached.id));
      }
    });
  }

  @override
  Future<void> cacheGenres({required Genres genres}) async {
    await localDb.getDb().writeTxn(() async {
      await localDb.getDb().genres.put(genres);
    });
  }

  @override
  Future<Either<AppException, Genres>> getGenreCache() async {
    final cachedGenres = await localDb.getDb().genres.where().findFirst();
    if (cachedGenres == null) {
      return Left(AppException(
          message: 'Genre not cached',
          statusCode: 0,
          identifier: 'genres',
          which: 'cache'));
    } else {
      return Right(cachedGenres);
    }
  }

  @override
  Future<Either<AppException, Movies>> getCacheMovies(
      {required String type}) async {
    final movies = await localDb
        .getDb()
        .movies
        .filter()
        .typeEqualTo(type)
        .pageEqualTo(0) // Cache on 0 page
        .findFirst();
    if (movies == null) {
      return Left(AppException(
          message: 'Cache not Found',
          statusCode: 0,
          identifier: type,
          which: 'cache'));
    } else {
      return Right(movies);
    }
  }
}
