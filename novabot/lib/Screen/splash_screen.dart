// import 'package:flutter/material.dart';
// import 'package:novabot/Screen/MyHomePgae.dart';
// import 'package:novabot/Screen/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  
//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class SplashScreen extends StatelessWidget {
//   final bool isLoggedIn;
  
//   SplashScreen({required this.isLoggedIn});
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: isLoggedIn ? HomePage() : LoginScreen(),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }
