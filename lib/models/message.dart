class Message {
  final String content;
  final MessageType type;
  final DateTime timestamp;

  Message(this.content, this.type, this.timestamp);
}

enum MessageType {
  error,
  success,
  info,
}
