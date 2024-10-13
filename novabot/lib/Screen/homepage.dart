import 'dart:io';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:novabot/sidebar/drawer.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:novabot/Themes/themeNotifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "NovaBot",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final messages = ref.watch(chatMessagesProvider);

    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog(context);
        if (shouldExit ?? false) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("NovaBot"),
          actions: [
            IconButton(
              icon: (themeMode == ThemeMode.dark)
                  ? Icon(Icons.light_mode, color: Theme.of(context).colorScheme.secondary)
                  : Icon(Icons.dark_mode, color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
        drawer: Sidebar(),
        body: _buildUI(messages),
      ),
    );
  }

  Future<bool?> _showExitConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App',
        style: TextStyle(color: Color(0xFF11455b)),
        ),
        content: Text('Do you want to exit the app?',
        style: TextStyle(color: Color(0xFF11455b)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  Widget _buildUI(List<ChatMessage> messages) {
    return DashChat(
      inputOptions: InputOptions(
        trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: const Icon(Icons.image),
          ),
        ],
        inputDecoration: InputDecoration(
          labelText: 'Write a message...',
          labelStyle: TextStyle(color: Color(0xff11455b)),
          border: OutlineInputBorder(),
        ),
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

void _sendMessage(ChatMessage chatMessage) {
  ref.read(chatMessagesProvider.notifier).addMessage(chatMessage);

  try {
    String question = chatMessage.text.toLowerCase();

    // Handle the specific question about the date
    if (question.contains("what's the date today") ||
        question.contains("what is the date today") ||
        question.contains("today's date") ||
        question.contains("whats the date today") ||
        question.contains("today date") ||
        question.contains("todays date") ||
        question.contains("current date")) {
      String currentDate = DateTime.now().toLocal().toString().split(' ')[0];
      ChatMessage responseMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "Today's date is $currentDate.",
      );
      ref.read(chatMessagesProvider.notifier).addMessage(responseMessage);

    // Handle the specific question about the app's owner
    } else if (question.contains("who is the owner of this app") ||
               question.contains("who created this app") ||
               question.contains("what is the name of person who created this app") ||
               question.contains("who created you")) {
      ChatMessage responseMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "NovaBot was launched in 2024 by Amina.",
      );
      ref.read(chatMessagesProvider.notifier).addMessage(responseMessage);

    // Handle the specific question about the AI's name
    } else if (question.contains("what is your name") ||
               question.contains("who are you") ||
               question.contains("what should I call you") ||
               question.contains("name")) {
      ChatMessage responseMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "My name is NovaBot.",
      );
      ref.read(chatMessagesProvider.notifier).addMessage(responseMessage);

    // Handle the specific question about the AI's state or emotions
    } else if (question.contains("okey")) {
      ChatMessage responseMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "Got it! If you have any more questions or need further assistance, just let me know!",
      );
      ref.read(chatMessagesProvider.notifier).addMessage(responseMessage);

    // Handle other specific responses
    } else if (question.contains("ok") ||
               question.contains("wokkey")) {
      ChatMessage responseMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: "Great! I'm here if you need anything. Just let me know!",
      );
      ref.read(chatMessagesProvider.notifier).addMessage(responseMessage);

    } else {
      // Handle other questions or generate a response using Gemini
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }

      gemini.streamGenerateContent(question, images: images).listen((event) {
        String response = event.content?.parts?.fold("", (previous, current) => "$previous ${current.text}") ?? "";
        ChatMessage message = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response,
        );
        ref.read(chatMessagesProvider.notifier).addMessage(message);
      });
    }
  } catch (e) {
    print(e);
  }
}




  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          ),
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}

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
