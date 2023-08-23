import 'package:dartz/dartz.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/models/response/casts_response.dart';

import 'package:filmku/shared/util/app_exception.dart';

abstract class MovieDetailRepository {
  Future<Either<AppException, MovieDetail>> getMovie({required int id});

  Future<Either<AppException, CastsResponse>> getCasts({required int id});

  Future<int> bookmarkMovieDetail(MovieDetail movieDetail);

  Future<bool> removeBookmark(MovieDetail movieDetail);

  Future<bool> isBookmarked(int id);
}
