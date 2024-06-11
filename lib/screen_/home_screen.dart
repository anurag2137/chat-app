import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';
import '../services/chat_services.dart';
import '../widgets/chat_msg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ChatMessages()),
          ChatInput(),
        ],
      ),
    );
  }
}

class ChatMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatService().messages,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        var messages = snapshot.data!.docs;

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            var message = messages[index];
            return ChatMessage(
              text: message['text'],
              sender: message['sender'],
              timestamp: message['timestamp'].toDate(),
            );
          },
        );
      },
    );
  }
}

class ChatInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatService = ChatService();
    final authService = Provider.of<AuthService>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              await chatService.sendMessage(
                _controller.text,
                authService.user!.email!,
              );
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
