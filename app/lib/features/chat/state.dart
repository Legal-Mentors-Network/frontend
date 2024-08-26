import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = NotifierProvider<ChatNotifier, List<types.Message>>(ChatNotifier.new);

class ChatNotifier extends Notifier<List<types.Message>> {
  @override
  List<types.Message> build() {
    return [];
  }

  void newMessage(types.Message message) {
    state = [...state, message];
  }

  Future<void> loadMessages() async {
    try {
      final response = await rootBundle.loadString('assets/messages.json');
      final messages = (jsonDecode(response) as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();
      state = messages;
    } catch (e) {
      log("Error loading messages: $e");
    }
  }
}
