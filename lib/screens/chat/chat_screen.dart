import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [
    {
      "sender": "bot",
      "text": "Hello! How can I assist you today?",
    },
    {
      "sender": "user",
      "text": "What services do you offer?",
    },
    {
      "sender": "bot",
      "text": "We offer a variety of services including ...",
    },
  ];

  void _sendMessage(String text) {
    setState(() {
      messages.add({
        "sender": "user",
        "text": text,
      });
      // Simulate bot response
      messages.add({
        "sender": "bot",
        "text": "This is a simulated response.",
      });
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message["sender"] == "user";
                return ListTile(
                  title: Align(
                    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(message["text"]!),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _sendMessage(_controller.text),
                  icon: Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
