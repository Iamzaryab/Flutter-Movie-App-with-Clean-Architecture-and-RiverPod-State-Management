import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/movie_detail/domain/use_cases/get_casts_use_case.dart';
import 'package:filmku/models/cast.dart';
import 'package:filmku/shared/util/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmku/models/response/casts_response.dart';

part 'casts_events.dart';
part 'casts_state.dart';

class CastsBloc extends Bloc<CastsEvent, CastsState> {
  final GetCastsUseCase _getCastsUseCase = injector.get<GetCastsUseCase>();

  bool get isFetching => state.state != CastConcreteState.loading;

  CastsBloc() : super(const CastsState.initial()) {
    on<GetCastsEvent>(getCasts);
  }

  Future<void> getCasts(GetCastsEvent event, Emitter<CastsState> emit) async {
    if (isFetching) {
      emit(state.copyWith(
        state: CastConcreteState.loading,
        isLoading: true,
      ));
      final response = await _getCastsUseCase.execute(movieId: event.movieId);
      updateStateFromGetCastsResponse(response, emit);
    }
  }

  void updateStateFromGetCastsResponse(
      Either<AppException, CastsResponse<dynamic>> response,
      Emitter<CastsState> emit) {
    response.fold((failure) {
      emit(state.copyWith(
        state: CastConcreteState.failure,
        message: failure.message,
        hasData: false,
        isLoading: false,
      ));
    }, (results) {
      final casts = results.casts.map((e) => Cast.fromJson(e)).toList();
      emit(state.copyWith(
          state: CastConcreteState.loaded,
          casts: casts,
          hasData: false,
          message: casts.isEmpty ? 'no casts found' : '',
          isLoading: false));
    });
  }
}
