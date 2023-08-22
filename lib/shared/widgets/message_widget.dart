import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/message_queue_provider.dart';

class MessageQueueWidget extends ConsumerWidget {
  const MessageQueueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageQueueProvider);

    return Builder(
      builder: (BuildContext context) {
        if (messages.isEmpty) {
          return Container();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Show SnackBar after the frame has been rendered.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(messages.last),
            ),
          );
          ref.read(messageQueueProvider.notifier).clearMessages();
        });

        return Container();
      },
    );
  }
}
