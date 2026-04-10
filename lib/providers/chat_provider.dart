import 'package:flutter/cupertino.dart';

import '../services/openai_service.dart';
import '../services/openrouter_service.dart';

class ChatProvider extends ChangeNotifier {
  final OpenAIService openAI = OpenAIService();
  final OpenRouterService openRouter = OpenRouterService();

  bool useOpenAI = true;

  List<Map<String, dynamic>> messages = [];
  bool isTyping = false;

  Future<void> sendMessage(String msg) async {
    await Future.delayed(const Duration(seconds: 2));
    messages.add({
      "role": "user",
      "text": msg,
      "time": DateTime.now(),
    });

    isTyping = true;
    notifyListeners();

    String reply;

    try {
      if (useOpenAI) {
        reply = await openAI.sendMessage(msg);
      } else {
        reply = await openRouter.sendMessage(msg);
      }
    } catch (e) {
      reply = "Unexpected error occurred";
    }

    messages.add({
      "role": "bot",
      "text": reply,
      "time": DateTime.now(),
    });

    isTyping = false;
    notifyListeners();
  }

  void toggleApi(bool val) {
    useOpenAI = val;
    notifyListeners();
  }
}