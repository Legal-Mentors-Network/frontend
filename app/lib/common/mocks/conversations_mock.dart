import 'package:lmn/models/conversation.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/models/user.dart';
import 'package:skeletonizer/skeletonizer.dart';

List<Conversation> getConversationsMock(int quantity) {
  final user = User(
    id: "1",
    profileId: "1",
    email: "example@mail.com",
    name: BoneMock.words(2),
    age: 24,
    location: "London",
    image: "asdadadada",
    onboarding: true,
  );

  final message = Message(
    id: "1",
    conversation: "1",
    author: "1",
    message: BoneMock.words(6),
    createdAt: DateTime.now(),
  );

  final conversation = Conversation(
    id: "1",
    author: user,
    recipient: user,
    latestMessage: message,
    unreadMessages: 0,
  );

  return List.filled(3, conversation);
}
