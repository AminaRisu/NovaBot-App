import 'package:flutter/material.dart';
import 'package:novabot/Screen/homepage.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11455B),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'NovoBot AI Assistant',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 16,),
                Text(
                  'Using this software, you can ask you questions and receive articles using artificial intelligence assistant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                )
              ],
            ),
            const SizedBox(height: 32,),
            Image.asset('asset/onBoarding.png'),
            const SizedBox(height: 32,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32)
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Continue',
                    style: TextStyle(
                      color: Colors.black
                    ),),
                    SizedBox(height: 8,),
                    Icon(Icons.arrow_forward,
                    color: Colors.black,)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}