import 'package:novabot/Screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  // we have also add the circular profressIndicator during waiting time
  bool isLoadin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("asset/otpimage.jpg"),
            const Text(
              "OTP Verification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff11455b)
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "We need to register your phone number by using a one-time OTP code verfification.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff11455b)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "+9771234567890",
                  labelText: "Enter Your OTP",
                  hintStyle: TextStyle(color: Color.fromARGB(31, 78, 72, 72))
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLoadin
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () async {
                      setState(() {
                        isLoadin = true;
                      });
                      try {
                        final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text,
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        isLoadin = false;
                      });
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}