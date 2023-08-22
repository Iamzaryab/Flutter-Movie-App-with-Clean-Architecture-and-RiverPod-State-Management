import 'package:dartz/dartz.dart';
import 'package:filmku/features/home/data/datasource/remote/home_remote_data_source.dart';
import 'package:filmku/models/response/genre_response.dart';
import 'package:filmku/models/response/movies_response.dart';
import 'package:filmku/shared/network/network_service.dart';

import 'package:filmku/shared/network/network_values.dart';
import 'package:filmku/shared/util/app_exception.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final NetworkService networkService;

  HomeRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<AppException, MoviesResponse>> getMovies(
      {required String endPoint, required int page}) async {
    final response = await networkService.get(endPoint, queryParams: {
      Params.page: page,
    });

    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(
          AppException(
              identifier: endPoint,
              statusCode: 0,
              message: 'The data is not in the valid format',
              which: 'http'),
        );
      }
      final moviesResponse =
          MoviesResponse.fromJson(jsonData, jsonData['results'] ?? []);
      return Right(moviesResponse);
    });
  }

  @override
  Future<Either<AppException, GenreResponse>> getGenre() async {
    final response = await networkService.get(EndPoints.genre);
    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(AppException(
            identifier: EndPoints.genre,
            statusCode: 0,
            message: 'The data is not in the valid format',
            which: 'http'));
      }
      final genresResponse = GenreResponse(jsonData['genres'] ?? []);
      return Right(genresResponse);
    });
  }
}
