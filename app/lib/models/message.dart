class Message {
  final String id;
  final String conversation;
  final String author;
  final String message;
  final DateTime createdAt;

  Message({
    required this.conversation,
    required this.id,
    required this.author,
    required this.message,
    required this.createdAt,
  });
}
