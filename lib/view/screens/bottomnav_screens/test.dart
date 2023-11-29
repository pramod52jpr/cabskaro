import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatMessage {
  String content;
  bool isUserMessage;

  ChatMessage(this.content, this.isUserMessage);
}
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> chatMessages = [];

  void fetchData() async {
    String developerAccessToken = "t0ragdJ5NJNbFB8m1KjEMs2JZrU6Sezz"; // Replace with your actual token

    final response = await http.get(
      Uri.parse("https://api.chatbot.com/v2/stories"),
      headers: {'authorization': 'Bearer $developerAccessToken'},
    );

    if (response.statusCode == 200) {
      // Parse the response and extract the chat message content
      String messageContent = parseMessageFromResponse(response.body);

      // Add the user message to the list
      chatMessages.add(ChatMessage(messageContent, true));

      // Simulate a bot response (replace this with actual bot response handling)
      String botResponse = "This is a bot response.";
      chatMessages.add(ChatMessage(botResponse, false));

      // Update the UI
      setState(() {});

      // Print the response to the console
      print("Response: $messageContent");
    } else {
      // Handle error
      print("Error: ${response.statusCode}, ${response.reasonPhrase}");
    }
  }

  String parseMessageFromResponse(String responseBody) {
    // Implement your logic to extract the message from the response body
    // For simplicity, this example assumes the response body is a plain text message.
    return "User message received: $responseBody";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                ChatMessage message = chatMessages[index];
                return ListTile(
                  title: Text(message.content),
                  // Add additional styling or customization based on whether it's a user or bot message
                  tileColor: message.isUserMessage ? Colors.blue : Colors.green,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Send Message'),
          ),
        ],
      ),
    );
  }
}