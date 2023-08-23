import 'package:dartz/dartz.dart';
import 'package:filmku/features/home/domain/repositories/home_repository.dart';
import 'package:filmku/models/genres.dart';
import 'package:filmku/shared/util/app_exception.dart';

class FetchAndCacheGenre {
  final HomeRepository homeRepository;

  FetchAndCacheGenre({required this.homeRepository});

  Future<Either<AppException, Genres>> execute() {
    return homeRepository.fetchAndCacheGenres();
  }
}
