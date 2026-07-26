import 'package:filmku/di/injector.dart';
import 'package:filmku/features/notifications/domain/use_cases/clear_all_notifications_use_case.dart';
import 'package:filmku/features/notifications/domain/use_cases/get_all_notifications_use_case.dart';
import 'package:filmku/features/notifications/presentation/provider/state/notification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  final GetAllNotificationsUseCase _getAllNotificationsUseCase =
      injector.get<GetAllNotificationsUseCase>();
  final ClearAllNotificationsUseCase _clearAllNotificationsUseCase =
      injector.get<ClearAllNotificationsUseCase>();

  NotificationNotifier() : super(const NotificationState.initial());

  bool get isFetching => state.state != NotificationConcreteState.loading;

  Future<void> getAllNotifications() async {
    if (isFetching) {
      state = state.copyWith(state: NotificationConcreteState.loading);
      final response = await _getAllNotificationsUseCase.execute();
      response.fold((failure) {
        state = state.copyWith(
          state: NotificationConcreteState.failure,
          message: failure.message,
          hasData: false,
          isLoading: false,
          notifications: [],
        );
      }, (success) {
        state = state.copyWith(
          state: NotificationConcreteState.loaded,
          message: '',
          hasData: true,
          isLoading: false,
          notifications: success,
        );
      });
    }
  }

  Future<void> clearNotifications() async {
    await _clearAllNotificationsUseCase.execute();
    state = state.copyWith(
      state: NotificationConcreteState.failure,
      message: 'No Notification Available',
      hasData: false,
      isLoading: false,
      notifications: [],
    );
  }

  void resetState() {
    state = const NotificationState.initial();
  }
}
