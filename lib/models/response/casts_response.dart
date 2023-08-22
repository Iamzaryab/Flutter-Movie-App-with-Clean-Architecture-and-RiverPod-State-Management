class CastsResponse<T> {
  final List<T> casts;

  CastsResponse(this.casts);

  @override
  String toString() {
    return 'CastsResponse{casts: $casts}';
  }
}
