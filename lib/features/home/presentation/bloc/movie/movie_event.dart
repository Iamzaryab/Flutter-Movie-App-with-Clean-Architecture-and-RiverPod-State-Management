part of 'movie_bloc.dart';
sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

final class GetMoviesEvent extends MovieEvent {
  final String type;
  const GetMoviesEvent({required this.type});

}
