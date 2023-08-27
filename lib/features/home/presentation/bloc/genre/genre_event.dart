import 'package:equatable/equatable.dart';

sealed class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object?> get props => [];
}

final class GetGenreLocalEvent extends GenreEvent {
  const GetGenreLocalEvent();
}

final class GetGenreRemoteEvent extends GenreEvent {
  const GetGenreRemoteEvent();
}