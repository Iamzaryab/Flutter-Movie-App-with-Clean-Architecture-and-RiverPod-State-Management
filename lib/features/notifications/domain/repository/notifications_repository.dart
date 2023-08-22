import 'package:dartz/dartz.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/shared/util/app_exception.dart';

abstract class NotificationRepository{
  Future<Either<AppException, List<NotificationModel>>> getNotifications();

  Future<void> clearNotifications();
}

