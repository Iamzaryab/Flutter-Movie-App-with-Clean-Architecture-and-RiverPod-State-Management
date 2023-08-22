class GenreResponse<T> {
  final List<T> genres;

  GenreResponse(this.genres);

  @override
  String toString() {
    return 'GenreResponse{genres: $genres}';
  }
}
