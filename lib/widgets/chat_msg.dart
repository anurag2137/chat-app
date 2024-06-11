import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;
  final DateTime timestamp;

  ChatMessage({required this.text, required this.sender, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sender),
      subtitle: Text(text),
      trailing: Text('${timestamp.hour}:${timestamp.minute}'),
    );
  }
}
