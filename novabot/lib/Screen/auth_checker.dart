import 'package:flutter/material.dart';
import 'package:novabot/Screen/home_screen.dart';
import 'package:novabot/Screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }
  

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');
    setState(() {
      _isLoggedIn = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? HomeScreen() : LoginScreen();
  }
}