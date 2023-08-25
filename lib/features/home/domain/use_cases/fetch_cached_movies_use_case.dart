import 'package:dartz/dartz.dart';
import 'package:filmku/features/home/domain/repositories/home_repository.dart';
import 'package:filmku/models/domain/movies.dart';
import 'package:filmku/shared/util/app_exception.dart';

class FetchCachedMoviesUseCase {
  final HomeRepository homeRepository;

  FetchCachedMoviesUseCase({required this.homeRepository});

  Future<Either<AppException, Movies>> execute({required String type}) {
    return homeRepository.fetchCachedMovies(type: type);
  }
}
