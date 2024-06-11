import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> get messages {
    return _firestore.collection('messages').orderBy('timestamp').snapshots();
  }

  Future<void> sendMessage(String text, String sender) async {
    await _firestore.collection('messages').add({
      'text': text,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
