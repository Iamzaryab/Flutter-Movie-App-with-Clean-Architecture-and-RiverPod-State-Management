import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';

class IsBookmarkedUseCase {
  final MovieDetailRepository movieDetailRepository;

  IsBookmarkedUseCase({required this.movieDetailRepository});

  Future<bool> execute(int movieId) async {
    return movieDetailRepository.isBookmarked(movieId);
  }
}