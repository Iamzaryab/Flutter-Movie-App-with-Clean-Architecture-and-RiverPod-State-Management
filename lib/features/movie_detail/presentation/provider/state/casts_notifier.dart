import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:filmku/features/movie_detail/presentation/provider/state/casts_state.dart';
import 'package:filmku/models/cast.dart';
import 'package:filmku/models/response/casts_response.dart';
import 'package:filmku/shared/util/app_exception.dart';

class CastsNotifier extends StateNotifier<CastsState> {
  final MovieDetailRepository movieDetailRepository =
      injector.get<MovieDetailRepository>();

  CastsNotifier() : super(const CastsState.initial());

  bool get isFetching => state.state != CastConcreteState.loading;

  Future<void> getCasts({required int id}) async {
    if (isFetching) {
      state = state.copyWith(
        state: CastConcreteState.loading,
        isLoading: true,
      );
      final response = await movieDetailRepository.getCasts(
          id: id);
      updateStateFromGetCastsResponse(response);
    }
  }

  void updateStateFromGetCastsResponse(
      Either<AppException, CastsResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: CastConcreteState.failure,
        message: failure.message,
        hasData: false,
        isLoading: false,
      );
    }, (results) {
      final casts = results.casts.map((e) => Cast.fromJson(e)).toList();
      state = state.copyWith(
          state: CastConcreteState.loaded,
          casts: casts,
          hasData: false,
          message: casts.isEmpty ? 'no casts found' : '',
          isLoading: false);
    });
  }
}
