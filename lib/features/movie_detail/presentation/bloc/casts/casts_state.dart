part of 'casts_bloc.dart';

enum CastConcreteState { initial, loading, loaded, failure }

class CastsState extends Equatable {
  final int id;
  final List<Cast> casts;
  final bool hasData;
  final String message;
  final bool isLoading;
  final CastConcreteState state;

  const CastsState(
      {this.id = 0,
      this.casts = const [],
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.state = CastConcreteState.initial});

  const CastsState.initial(
      {this.id = 0,
      this.casts = const [],
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.state = CastConcreteState.initial});

  CastsState copyWith(
      {int? id,
      List<Cast>? casts,
      bool? hasData,
      String? message,
      bool? isLoading,
      CastConcreteState? state}) {
    return CastsState(
        id: id ?? this.id,
        casts: casts ?? this.casts,
        hasData: hasData ?? this.hasData,
        isLoading: isLoading ?? this.isLoading,
        state: state ?? this.state);
  }

  @override
  List<Object?> get props => [id, casts, hasData, isLoading, state];
}
