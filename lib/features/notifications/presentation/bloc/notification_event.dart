part of 'notification_bloc.dart';
sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllNotificationsEvent extends NotificationsEvent {
  const GetAllNotificationsEvent();
}

class ClearAllNotificationsEvent extends NotificationsEvent {
  const ClearAllNotificationsEvent();
}
