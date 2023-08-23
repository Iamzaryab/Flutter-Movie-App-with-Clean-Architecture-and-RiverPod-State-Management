import 'package:dartz/dartz.dart';
import 'package:filmku/app/app_configs.dart';
import 'package:filmku/features/home/data/datasource/local/home_local_datasource.dart';
import 'package:filmku/features/home/data/datasource/remote/home_remote_data_source.dart';
import 'package:filmku/features/home/domain/repositories/home_repository.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/models/movie.dart';
import 'package:filmku/shared/util/app_exception.dart';

import 'package:filmku/models/genre.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<AppException, Movies>> fetchAndCacheMovies(
      {required int page, required String type}) async {
    final response =
        await homeRemoteDataSource.getMovies(endPoint: type, page: page);
    return response.fold((failure) => Left(failure), (success) {
      final listMovies = success.results.map((e) => Movie.fromJson(e)).toList();
      final Movies movies = Movies(
          movies: listMovies,
          page: success.page,
          type: type,
          totalPages: success.totalPages,
          totalResults: success.totalResults);
      if (movies.page <= AppConfigs.shouldCachePages) {
        homeLocalDataSource.cacheMovies(
            movies: movies.copyWith(page: 0, cached: true)); // Cache Page 0
      }
      return Right(movies);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchAndCacheGenres() async {
    final response = await homeRemoteDataSource.getGenre();
    return response.fold((failure) => Left(failure), (success) {
      final genres =
          Genres(genres: success.genres.map((e) => Genre.fromJson(e)).toList());
      homeLocalDataSource.cacheGenres(genres: genres);
      return Right(genres);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchCachedGenres() {
    return homeLocalDataSource.getGenreCache();
  }

  @override
  Future<Either<AppException, Movies>> fetchCachedMovies(
      {required String type}) {
    return homeLocalDataSource.getCacheMovies(type: type);
  }
}
