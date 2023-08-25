part of 'casts_bloc.dart';
sealed class CastsEvent extends Equatable {
  const CastsEvent();

  @override
  List<Object?> get props => [];
}

final class GetCastsEvent extends CastsEvent {
  final int movieId;
  const GetCastsEvent({required this.movieId});
}
