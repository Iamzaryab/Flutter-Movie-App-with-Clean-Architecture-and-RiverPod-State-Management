class EndPoints {
  static const String nowShowing = 'movie/now_playing';
  static const String popular = 'movie/top_rated';
  static const String genre = 'genre/movie/list';

  static String movie(id) => 'movie/$id';

  static String casts(int id) => '/movie/$id/credits';
}

class Params {
  static const String page = 'page';
  static const String apiKey = 'api_key';
}
