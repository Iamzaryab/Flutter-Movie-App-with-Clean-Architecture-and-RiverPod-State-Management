class AppConfigs {
  // static const String baseUrl = 'https://api.themoviedb.org/3/';

  static String preMovieBackdrop(String path) =>
      'https://image.tmdb.org/t/p/w780$path';

  static String preMoviePoster(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String preCastProfilePath(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  static const int shouldCachePages = 1;
  // static const String apiKey = '0e7274f05c36db12cbe71d9ab0393d47';
}
