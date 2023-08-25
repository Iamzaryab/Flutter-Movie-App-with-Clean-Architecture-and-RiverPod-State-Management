import 'package:equatable/equatable.dart';

sealed class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object?> get props => [];
}

final class GetGenreEvent extends GenreEvent {
  const GetGenreEvent();
}
