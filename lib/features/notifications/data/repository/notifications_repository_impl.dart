import 'package:dartz/dartz.dart';
import 'package:filmku/features/notifications/data/datasource/local/notifications_local_datasource.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/features/notifications/domain/repository/notifications_repository.dart';
import 'package:filmku/shared/util/app_exception.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationsLocalDataSource notificationsLocalDataSource;

  NotificationRepositoryImpl({required this.notificationsLocalDataSource});

  @override
  Future<void> clearNotifications() {
    return notificationsLocalDataSource.clearNotifications();
  }

  @override
  Future<Either<AppException, List<NotificationModel>>> getNotifications() {
    return notificationsLocalDataSource.getNotifications();
  }
}
