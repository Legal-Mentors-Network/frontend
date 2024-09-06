import 'dart:developer';

import 'package:lmn/models/message.dart';
import 'package:lmn/models/user.dart';
import 'package:pocketbase/pocketbase.dart';

class Conversation {
  final String id;
  final User author;
  final User recipient;

  final Message latestMessage;

  // should come from latest message
  final int? unreadMessages;

  Conversation({
    required this.id,
    required this.author,
    required this.recipient,
    required this.latestMessage,
    this.unreadMessages = 0,
  });

  factory Conversation.fromNetwork(RecordModel record) {
    final (authorProfile, recipientProfile, latestMessage) = _expandRecords(record.expand);

    if (authorProfile == null || recipientProfile == null || latestMessage == null) {
      log("Invalid conversation record");
      throw Exception("Invalid conversation record");
    }

    return Conversation(
      id: record.id,
      author: User.fromNetwork(authorProfile),
      recipient: User.fromNetwork(recipientProfile),
      latestMessage: Message.fromNetwork(latestMessage),
      unreadMessages: record.getIntValue('unreadMessages'),
    );
  }

  static (RecordModel?, RecordModel?, RecordModel?) _expandRecords(Map<String, Object?> data) {
    if (data['authorProfile'] == null || data['recipientProfile'] == null) {
      return (null, null, null);
    }

    try {
      final authorProfile = (data['authorProfile'] ?? []) as List<RecordModel>;
      final recipientProfile = (data['recipientProfile'] ?? []) as List<RecordModel>;
      final latestMessage = (data['latestMessage'] ?? []) as List<RecordModel>;
      return (authorProfile[0], recipientProfile[0], latestMessage[0]);
    } catch (e) {
      log("error mapping $e");
    }

    return (null, null, null);
  }
}
