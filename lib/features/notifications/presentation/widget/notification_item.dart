import 'package:flutter/cupertino.dart';
import 'package:filmku/app/app_colors.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;
   const NotificationItem({Key? key,required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(top: AppDimens.p4,right: AppDimens.p8,left: AppDimens.p8),
      child: Container(
        padding: EdgeInsets.only(top: AppDimens.p12,bottom: AppDimens.p12,right: AppDimens.p12,left: AppDimens.p12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.p8),
          color: context.theme.brightness == Brightness.light
              ? notificationModel.positive
              ? AppColors.updateNotificationColorLight
              : AppColors.deleteNotificationColorLight
              : notificationModel.positive
              ? AppColors.updateNotificationColorDark // Dark theme - Dark green color for update notifications
              : AppColors.deleteNotificationColorDark
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movie: ${notificationModel.title}', style: context.textTheme.titleSmall!.copyWith(color: AppColors.white)),
            Text(notificationModel.message ,style: context.textTheme.bodySmall!.copyWith(color: AppColors.white),)
          ],
        ),
      ),
    );
  }
}
