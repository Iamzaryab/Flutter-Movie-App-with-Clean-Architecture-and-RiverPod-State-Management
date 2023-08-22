import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/notifications/domain/repository/notifications_repository.dart';
import 'package:filmku/features/notifications/presentation/provider/state/notification_state.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  final NotificationRepository notificationRepository =
      injector.get<NotificationRepository>();

  NotificationNotifier() : super(const NotificationState.initial());

  bool get isFetching => state.state != NotificationConcreteState.loading;

  Future<void> getAllNotifications() async {
    if (isFetching) {
      state = state.copyWith(state: NotificationConcreteState.loading);
      final response = await notificationRepository.getNotifications();
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
    await notificationRepository.clearNotifications();
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
