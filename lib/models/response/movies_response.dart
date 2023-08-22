class MoviesResponse<T> {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  MoviesResponse({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory MoviesResponse.fromJson(dynamic json, List<T> results,
          {Function(dynamic json)? fixtures}) =>
      MoviesResponse(
          page: json['page'],
          totalPages: json['total_pages'],
          totalResults: json['total_results'],
          results: results);

  @override
  String toString() {
    return 'MoviesResponse{page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results}';
  }
}
