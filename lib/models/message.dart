import 'package:pocketbase/pocketbase.dart';

class Message {
  final String id;
  final String conversation;
  final String author;
  final String message;
  final Uri? attachment;
  final DateTime createdAt;

  Message({
    required this.conversation,
    required this.id,
    required this.author,
    required this.message,
    required this.createdAt,
    this.attachment,
  });

  factory Message.fromNetwork(RecordModel record, {Uri? attachment}) {
    return Message(
      id: record.id,
      author: record.getStringValue('author'),
      conversation: record.getStringValue('conversation'),
      message: record.getStringValue('message'),
      attachment: attachment,
      createdAt: DateTime.parse(record.created),
    );
  }
}
