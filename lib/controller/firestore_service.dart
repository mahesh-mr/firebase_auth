import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future insertNote(String title, String discription, String userId) async {
    try {
      await firestore.collection('note').add({
        "title": title,
        "discription": discription,
        "userId": userId,
        "date": DateTime.now(),
      });
    } catch (e) {}
  }
}
