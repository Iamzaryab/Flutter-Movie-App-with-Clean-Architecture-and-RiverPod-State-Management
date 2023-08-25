import 'package:equatable/equatable.dart';
import 'package:filmku/di/Injector.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/features/notifications/domain/use_cases/clear_all_notifications_use_case.dart';
import 'package:filmku/features/notifications/domain/use_cases/get_all_notifications_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationsEvent, NotificationState> {
  final GetAllNotificationsUseCase _getALLNotificationUseCase =
      injector.get<GetAllNotificationsUseCase>();
  final ClearAllNotificationsUseCase _clearAllNotificationsUseCase =
      injector.get<ClearAllNotificationsUseCase>();

  bool get isFetching => state.state != NotificationConcreteState.loading;

  NotificationBloc() : super(const NotificationState.initial()) {
    on<GetAllNotificationsEvent>(getAllNotifications);
  }

  Future<void> getAllNotifications(
      GetAllNotificationsEvent event, Emitter<NotificationState> emit) async {
    if (isFetching) {
      emit(state.copyWith(state: NotificationConcreteState.loading));
      final response = await _getALLNotificationUseCase.execute();
      response.fold((failure) {
        emit(state.copyWith(
          state: NotificationConcreteState.failure,
          message: failure.message,
          hasData: false,
          isLoading: false,
          notifications: [],
        ));
      }, (success) {
        emit(state.copyWith(
          state: NotificationConcreteState.loaded,
          message: '',
          hasData: true,
          isLoading: false,
          notifications: success,
        ));
      });
    }
  }

  Future<void> clearNotifications(
      ClearAllNotificationsEvent event, Emitter<NotificationState> emit) async {
    await _clearAllNotificationsUseCase.execute();
    emit(state.copyWith(
      state: NotificationConcreteState.failure,
      message: 'No Notification Available',
      hasData: false,
      isLoading: false,
      notifications: [],
    ));
  }
}
