import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService{


  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  /*
  List<Map<String,dynamic> =

  [
  {
  'email':test@gmail.com,
  'id':..
  },
  ]

 */
  Stream<List<Map<String,dynamic>>>getUserStream(){
    return _firestore.collection("User").snapshots().map((snapshot)
        {
          return snapshot.docs.map((doc){
            final user =doc.data();
            return user;
          }).toList();
        });
  }
}