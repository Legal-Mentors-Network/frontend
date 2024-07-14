class Conversation {
  final String id;
  final String author;
  final String recipient;

  final String latestMessage;

  // should come from latest message
  final int? unreadMessages;

  Conversation({
    required this.id,
    required this.author,
    required this.recipient,
    required this.latestMessage,
    this.unreadMessages = 0,
  });
}
