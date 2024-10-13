import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novabot/Google/google_auth.dart';
import 'package:novabot/Screen/Onboarding.dart';
import '../Widget/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulation\nYou have successfully Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
              color: Color(0xff11455b)
              ),
            ),

            MyButtons(
                onTap: () async {
                  await FirebaseServices().googleSignOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Onboarding(),
                    ),
                  );
                },
                text: "Continue"),
            // for google sign in ouser detail
            Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
            Text("${FirebaseAuth.instance.currentUser!.email}",
            style: TextStyle(color: Color(0xff11455b)),
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}",
            style: TextStyle(color: Color(0xff11455b)),
            )
          ],
        ),
      ),
    );
  }
}