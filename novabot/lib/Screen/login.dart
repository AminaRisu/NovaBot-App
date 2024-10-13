import 'package:flutter/material.dart';
import 'package:novabot/Google/google_auth.dart';
import 'package:novabot/Phone_Auth/phone_login.dart';
import 'package:novabot/Screen/auth.dart';
import 'package:novabot/Screen/forget_password.dart';
import 'package:novabot/Widget/button.dart';
import 'package:novabot/Widget/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/snackbar.dart';
import 'home_screen.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // This will help to resize the screen when the keyboard appears
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the content with SingleChildScrollView
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 2.7,
                  child: Image.asset('asset/robosleep.png'),
                ),
                TextFieldInput(
                  icon: Icons.person,
                  textEditingController: emailController,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.text,
                ),
                TextFieldInput(
                  icon: Icons.lock,
                  textEditingController: passwordController,
                  hintText: 'Enter your passord',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const ForgotPassword(),
                MyButtons(onTap: loginUser, text: "Log In",),
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Colors.black26),
                    ),
                    const Text(
                      "  or  ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Container(height: 1, color: Colors.black26),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF11455B),
                    ),
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Image.network(
                            "https://ouch-cdn2.icons8.com/VGHyfDgzIiyEwg3RIll1nYupfj653vnEPRLr0AeoJ8g/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODg2/LzRjNzU2YThjLTQx/MjgtNGZlZS04MDNl/LTAwMTM0YzEwOTMy/Ny5wbmc.png",
                            height: 35,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const PhoneAuthentication(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black45,
          width: 2,
        ),
      ),
      child: Image.network(
        image,
        height: 40,
      ),
    );
  }
}
