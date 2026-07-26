import 'package:filmku/shared/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class MessageQueueWrapper extends StatelessWidget {
  final Widget child;

  const MessageQueueWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child, // Your current screen's content
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MessageQueueWidget(),
          ),
        ],
      ),
    );
  }
}
