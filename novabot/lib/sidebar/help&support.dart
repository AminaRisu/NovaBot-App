import 'package:flutter/material.dart';

class Helpandsupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('asset/support.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'Hi, how can we help?',
              style: TextStyle(fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF11455B),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Automate repetitive and common customer inquiries through the chatbot, freeing up human agents to handle more complex issues. Provide self-service options through the chatbot, allowing customers to find answers and solutions on their own.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),
            //  const SizedBox(height: 20),
            // // Add another image here
            // Image.asset('asset/about.png', height: 150),
            // const Text('NovaBot is an application that is able to communicate with humans using natural language. An image recognition deep learning based chatbot is an application to recognize the image which the user uploaded and answer the questions about the image.Image recognition is yet another task within computer vision. Its algorithms are designed to analyze the content of an image and classify it into specific categories or labels, which can then be put to use.',
            // style: TextStyle(
            //   color: Color(0xFF11455B),
            // ),
            // ),
            
            const SizedBox(height: 20),
            const Text(
              'FAQs',
              style: TextStyle(fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF11455B),
              ),
            ),
            Image.asset('asset/faq.png', height: 150),
            const SizedBox(height: 20,),
            const Text('What information sources will the chatbot use?',
            style: TextStyle(fontWeight: FontWeight.w500,
            color: Color(0xFF11455B)),
            ),
            const SizedBox(height: 10),
            const Text(
              'In order for a chatbot to function properly, it is crucial for the programme to access your business data, whether from your existing knowledge base, website, internal databases, existing documents, reservation systems, shipping information, product inventories or other sources of information.Once you have determined which data sources will be needed to answer the question asked, you can identify how the bot will access each source in order to interact with the user in a meaningful way. Will you need to make your existing sources available? Is there an open API you can use?',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),

            const Text('How long does the implementation of a chatbot take?',
            style: TextStyle(fontWeight: FontWeight.w500,
            color: Color(0xFF11455B)),
            ),
            const SizedBox(height: 10),
            const Text(
              'It depends on the complexity of the client requirements. Our current record is 4-6 weeks to build an average simple bot. However, in more complex scenarios, where the client requirements are not clear or there is a need for multi phases of building, it might take 2-3 months.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),

            const Text('What kinds of questions should the chatbot be able to answer?',
            style: TextStyle(fontWeight: FontWeight.w500,
            color: Color(0xFF11455B)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Chatbots are designed to respond to the most frequent customer requests and use cases. It is important to focus on mastering these questions before adding new functions and conversations later on.Remember to list all the common questions and prioritise them with regard to the volume and complexity of each required response.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),

            const Text('Are your chatbots multilingual?',
            style: TextStyle(fontWeight: FontWeight.w500,
            color: Color(0xFF11455B)),
            ),
            const SizedBox(height: 10),
            const Text(
              'At NoVaBot, we deliver multilingual support at scale and automate customer service in both English and Arabic. Our chatbots are trained to decipher different Arabic dialects, understand exactly what the user wants and respond naturally and accurately.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
              ),
            ),

            const Text('What security concerns are there with bots?',
            style: TextStyle(fontWeight: FontWeight.w500,
            color: Color(0xFF11455B)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Data protection is our top priority. As long as your website and technology stack are set up securely and you take steps to ensure that your customer data is secure, then rest assured that your data is safe with us.At Novabot, we use protocols, systems and security to protect users.',
              style: TextStyle(fontSize: 16,
              color: Color(0xFF11455B),
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
