import 'package:dartz/dartz.dart';
import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:filmku/models/response/casts_response.dart';
import 'package:filmku/shared/util/app_exception.dart';

class GetCastsUseCase {
  final MovieDetailRepository movieDetailRepository;

  GetCastsUseCase({required this.movieDetailRepository});

  Future<Either<AppException, CastsResponse>> execute({required int movieId}) async {
    return movieDetailRepository.getCasts(id: movieId);
  }
}
