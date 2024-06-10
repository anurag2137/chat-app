import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> messages = [];
  TextEditingController _textEditingController = TextEditingController();
  bool _isSendingImage = false;
  bool _showSentImageMessage = false;
  bool _lastMessageWasSentByUser = false;
  bool _isNewDummyMessage = false; // Flag to track new dummy message

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isSendingImage = true;
        messages.add(File(pickedFile.path));
      });

      setState(() {
        _showSentImageMessage = true;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _showSentImageMessage = false;
      });

      setState(() {
        _isSendingImage = false;
      });
    }
  }

  String getDummyMessage(String userMessage) {
    if (userMessage.toLowerCase().contains('hello') ||
        userMessage.toLowerCase().contains('hi')) {
      return 'Hello';
    } else if (userMessage.toLowerCase().contains('how are you')) {
      return 'I am fine';
    } else if (userMessage.toLowerCase().contains('image')) {
      return 'Nice!';
    } else {
      return 'I don\'t understand';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    if (index == 0 && messages[index] is String && _isNewDummyMessage) {
                      _isNewDummyMessage = false; // Reset flag after showing notification
                      _showDummyNotification(); // Show notification for new dummy message
                    }
                    if (index == 0 && _showSentImageMessage) {
                      return _buildSentImageMessage();
                    } else {
                      final message = messages[index];
                      final isMe = _lastMessageWasSentByUser;
                      _lastMessageWasSentByUser = !isMe && message is String;
                      return MessageBubble(
                        message: message,
                        isMe: isMe,
                        showSeenIcon: index == 0 && !_isSendingImage,
                        onTapImage: (File image) {
                          _showSavedImagePreview(image);
                        },
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        _getImageFromGallery();
                      },
                    ),
                    SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () async {
                        String message = _textEditingController.text;
                        if (message.isNotEmpty) {
                          setState(() {
                            messages.insert(0, message);
                            _textEditingController.clear();
                          });

                          _isNewDummyMessage = true; // Set flag for new dummy message

                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              messages.insert(0, getDummyMessage(message));
                            });
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSentImageMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.grey),
          SizedBox(width: 8.0),
          Text(
            'Image sent',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showSavedImagePreview(File image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SavedImagePreview(image: image),
        );
      },
    );
  }

  void _showDummyNotification() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              FlutterLogo(),
              SizedBox(width: 12),
              Text('you got a New Message'),
            ],
          ),
        ),
      );
    });
  }
}

class MessageBubble extends StatelessWidget {
  final dynamic message;
  final bool isMe;
  final bool showSeenIcon;
  final Function(File)? onTapImage;

  const MessageBubble({
    required this.message,
    required this.isMe,
    this.showSeenIcon = false,
    this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (message is File && onTapImage != null) {
          onTapImage!(message);
        }
      },
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isMe && showSeenIcon)
                Icon(Icons.check_circle, color: Colors.grey),
              if (!isMe) SizedBox(width: 8.0),
              if (!isMe) CircleAvatar(
                backgroundImage: AssetImage('images/boy.jpeg'),
              ),
              if (message is String)
                Flexible(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                )
              else if (message is File)
                Flexible(
                  child: Image.file(
                    message,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              if (isMe) SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedImagePreview extends StatelessWidget {
  final File image;

  const SavedImagePreview({required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(image),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Image saved!'),
                ),
              );
            },
            child: Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
