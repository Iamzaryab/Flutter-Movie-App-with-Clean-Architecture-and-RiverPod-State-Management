import 'package:equatable/equatable.dart';

import 'package:filmku/models/genre.dart';

enum GenreConcreteState { initial, loading, loaded, failure }

class GenreState extends Equatable {
  final List<Genre> genres;
  final bool hasData;
  final String message;
  final GenreConcreteState state;
  final bool isLoading;

  const GenreState(
      {this.genres = const [],
      this.hasData = false,
      this.message = '',
      this.state = GenreConcreteState.initial,
      this.isLoading = false});

  const GenreState.initial(
      {this.genres = const [],
      this.hasData = false,
      this.message = '',
      this.state = GenreConcreteState.initial,
      this.isLoading = false});

  GenreState copyWith(
      {List<Genre>? genres,
      bool? hasData,
      String? message,
      GenreConcreteState? state,
      bool? isLoading}) {
    return GenreState(
        genres: genres ?? this.genres,
        message: message ?? this.message,
        hasData: hasData ?? this.hasData,
        state: state ?? this.state,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [genres, message, hasData, state, isLoading];
}
