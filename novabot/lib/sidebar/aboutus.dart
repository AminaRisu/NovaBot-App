import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('asset/childbot.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'About NovaBot',
              style: TextStyle(fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF11455B),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'With NovaBot, you can automate repetitive tasks and improve customer engagement by using AI-powered text-based artificial intelligence. Through the use of natural language processing algorithms, it recognizes and responds to rudimentary questions accurately.NovaBot are conversational tools that perform routine tasks efficiently. People like them because they help them get through those tasks quickly so they can focus their attention on high-level, strategic, and engaging activities that require human capabilities that cannot be replicated by machines.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),
             const SizedBox(height: 20),
            // Add another image here
            Image.asset('asset/about.png', height: 150),
            const Text('NovaBot is an application that is able to communicate with humans using natural language. An image recognition deep learning based chatbot is an application to recognize the image which the user uploaded and answer the questions about the image.Image recognition is yet another task within computer vision. Its algorithms are designed to analyze the content of an image and classify it into specific categories or labels, which can then be put to use.',
            style: TextStyle(
              color: Color(0xFF11455B),
            ),
            ),
            
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF11455B)
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('novabotz001@gmail.com'),
              iconColor: Color(0xFF11455B),
              textColor: Color(0xFF11455B),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              subtitle: Text('+1 234 567 890'),
              iconColor: Color(0xFF11455B),
              textColor: Color(0xFF11455B),
            ),
            const SizedBox(height: 20,),
            const Padding(padding: EdgeInsets.only(left: 65), 
            child: Text('NovoBot can make mistakes. Check important info.',
            style:TextStyle(color: Color(0xFF11455B))),
            ),
          ],
        ),
      ),
    );
  }
}
