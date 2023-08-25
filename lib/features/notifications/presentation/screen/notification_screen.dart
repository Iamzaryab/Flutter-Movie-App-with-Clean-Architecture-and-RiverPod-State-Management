import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:filmku/features/notifications/presentation/widget/notification_item.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void notificationBottomSheet(BuildContext context, NotificationState state) {
  context.read<NotificationBloc>().add(const GetAllNotificationsEvent());
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Notifications',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            context
                                .read<NotificationBloc>()
                                .add(const ClearAllNotificationsEvent());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: AppDimens.p10,
                                right: AppDimens.p12,
                                bottom: AppDimens.p12,
                                left: AppDimens.p12),
                            child: Text('Clear All',
                                style: context.textTheme.bodySmall),
                          )),
                    )
                  ],
                ),
              ),
              state.notifications.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return NotificationItem(
                            notificationModel: state.notifications[index]);
                      },
                      childCount: state.notifications.length,
                    ))
                  : const SliverFillRemaining(
                      child: Center(
                        child: Text('No notification available'),
                      ),
                    )
            ])),
      );
      
    },
  );
}
