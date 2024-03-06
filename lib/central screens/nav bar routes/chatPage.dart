import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final List<Map<String, String>> past_messages = [];
  bool _showInfoCard = true;

  void _sendMessage(String text) async {
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUserMessage: true));
    });
    past_messages.add({"role": "user", "content": text});
    var apiKey =
        "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"; // Your OpenAI API Key
    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": past_messages,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var botResponse = data['choices'][0]['message']['content'];

      setState(() {
        _messages.add(ChatMessage(text: botResponse, isUserMessage: false));
      });
    } else {
      // Handle API errors
      print("${response.body} \n status code != 200");
    }
    _textController.clear();
  }

  @override
  void initState() {
    super.initState();
    _displayInfoCard(); // Show the card initially
  }

  void _displayInfoCard() {
    if (_showInfoCard) {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
              text:
                  "Hi!  I'm powered by ChatGPT.  I can help you learn!  Ask me questions about any topic you're struggling with, and I can provide explanations or suggest a study plan.",
              isUserMessage: false),
        );
      });
      _showInfoCard = false; // Hide the card after displaying once
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"), // Name your chatbot!
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: _messages[index].isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Text(_messages[index].text),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: "Type your question...",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _sendMessage(_textController.text),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}
