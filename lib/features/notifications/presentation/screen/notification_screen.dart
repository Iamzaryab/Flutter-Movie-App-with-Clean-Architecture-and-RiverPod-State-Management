import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/notifications/presentation/provider/notification_provider.dart';
import 'package:filmku/features/notifications/presentation/widget/notification_item.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

void notificationBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          Future(() {
            ref
                .read(notificationStateProvider.notifier)
                .getAllNotifications();
          });
          final notificationsNotifier = ref.watch(notificationStateProvider);
          return ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child:  Column(
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
                            onTap: (){
                              if(notificationsNotifier.notifications.isNotEmpty){
                                ref.read(notificationStateProvider.notifier).clearNotifications();
                              }

                            },
                              child: Padding(
                                padding: EdgeInsets.only(top: AppDimens.p10, right: AppDimens.p12,bottom: AppDimens.p12, left: AppDimens.p12),
                                child:  Text('Clear All',style: context.textTheme.bodySmall),
                              )),
                        )
                      ],
                    ),
                  ),
                  notificationsNotifier.notifications.isNotEmpty
                  ?SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return NotificationItem(notificationModel: notificationsNotifier.notifications[index]);
                    },
                    childCount: notificationsNotifier.notifications.length,
                  ))
                      :const SliverFillRemaining(child: Center(child: Text('No notification available'),),)
                ])),
          );
        },
      );
    },
  );
}


