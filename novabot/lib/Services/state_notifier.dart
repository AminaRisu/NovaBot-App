import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

// Define a StateNotifier for the chat messages
class ChatMessagesNotifier extends StateNotifier<List<ChatMessage>> {
  ChatMessagesNotifier() : super([]);

  void addMessage(ChatMessage message) {
    state = [message, ...state];
  }
}

// Define a provider for the chat messages
final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<ChatMessage>>((ref) {
  return ChatMessagesNotifier();
});
