class Conversation {
  final String id;
  final String author;
  final String recipient;

  final String latestMessageId;

  // should come from latest message
  final int? unreadMessages;

  Conversation({
    required this.id,
    required this.author,
    required this.recipient,
    required this.latestMessageId,
    this.unreadMessages = 0,
  });
}
