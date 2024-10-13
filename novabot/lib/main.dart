import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novabot/Screen/homepage.dart';
import 'package:novabot/Screen/login.dart';
import 'package:novabot/Themes/themes.dart';
import 'package:novabot/consts.dart';
import 'package:novabot/Themes/themeNotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final bool loggedIn = snapshot.data ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode,
          initialRoute: loggedIn ? '/home' : '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
