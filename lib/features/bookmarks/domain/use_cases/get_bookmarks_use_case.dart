import 'package:dartz/dartz.dart';
import 'package:filmku/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/shared/util/app_exception.dart';

class GetBookmarksUseCase {
  final BookmarkRepository bookmarkRepository;

  GetBookmarksUseCase({required this.bookmarkRepository});

  Future<Either<AppException, List<MovieDetail>>> execute() async {
    return bookmarkRepository.getBookmarks();
  }
}
