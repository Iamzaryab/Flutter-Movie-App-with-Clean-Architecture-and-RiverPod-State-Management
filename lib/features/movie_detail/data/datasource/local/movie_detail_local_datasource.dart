import 'package:filmku/models/movie_detail.dart';

abstract class MovieDetailLocalDataSource {
  Future<int> bookmarkMovie(MovieDetail movieDetail);

  Future<bool> removeBookmark(MovieDetail movieDetail);

  Future<bool> isBookmarked(int id);
}
