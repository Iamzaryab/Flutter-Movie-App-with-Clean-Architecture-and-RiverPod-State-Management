import 'package:equatable/equatable.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';

enum NotificationConcreteState { initial, loading, loaded, failure }

class NotificationState extends Equatable {
  final NotificationConcreteState state;
  final bool hasData;
  final String message;
  final bool isLoading;
  final List<NotificationModel> notifications;

  const NotificationState(
      {this.state = NotificationConcreteState.initial,
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.notifications = const []});

  const NotificationState.initial(
      {this.state = NotificationConcreteState.initial,
      this.hasData = false,
      this.message = '',
      this.isLoading = false,
      this.notifications = const []});

  NotificationState copyWith({
    NotificationConcreteState? state,
    bool? hasData,
    String? message,
    bool? isLoading,
    List<NotificationModel>? notifications,
  }) {
    return NotificationState(
      state: state ?? this.state,
      hasData: hasData ?? this.hasData,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props =>[notifications,hasData,message,isLoading,state];
}
