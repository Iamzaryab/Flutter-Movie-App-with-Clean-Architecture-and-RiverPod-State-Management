import 'package:dartz/dartz.dart';

import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/shared/local/cache/local_db.dart';

import 'package:filmku/shared/util/app_exception.dart';
import 'package:isar/isar.dart';

import 'notifications_local_datasource.dart';

class NotificationsLocalDataSourceImpl extends NotificationsLocalDataSource {
  final LocalDb localDb;

  NotificationsLocalDataSourceImpl({required this.localDb});

  @override
  Future<void> clearNotifications() async {
    await localDb.getDb().writeTxn(() async {
      await localDb.getDb().notificationModels.clear();
    });
  }

  @override
  Future<Either<AppException, List<NotificationModel>>>
      getNotifications() async {
    final response = await localDb.getDb().notificationModels.where(sort: Sort.asc).findAll();
    if (response.isEmpty) {
      return Left(AppException(
          message: 'No Notification available',
          statusCode: 0,
          identifier: 'notification',
          which: 'local'));
    } else {
      return Right(response);
    }
  }
}
