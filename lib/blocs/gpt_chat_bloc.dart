import 'package:flutter/material.dart';
import 'package:news_app/models/message.dart';

class GptChatBloc extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.insert(0, message);
    notifyListeners();
  }
}
