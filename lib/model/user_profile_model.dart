import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  // final _auth = FirebaseAuth.instance;
  // final firestoreData = FirebaseFirestore.instance.collection("users").snapshots();
  String collection = "users";

  String id = "id";
  String name = "name";
  String email = "email";
  String phone = "phone";
  String photo = "photo";


  // Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getUserProfie() async {
  //   return firestoreData;
  // }
}
