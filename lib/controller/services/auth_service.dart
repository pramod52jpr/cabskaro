import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {

  final firestore=FirebaseFirestore.instance.collection(UserProfile().collection);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? processGoogle =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication accountAuth =
          await processGoogle!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: accountAuth.accessToken,
        idToken: accountAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        await firestore.doc(userCredential.user!.uid).set({
          UserProfile().id: userCredential.user!.uid,
          UserProfile().name: userCredential.user!.displayName ?? "",
          UserProfile().email: userCredential.user!.email ?? "",
          UserProfile().phone: "",
          UserProfile().photo: "",
          UserProfile().home: "",
          UserProfile().work: "",
        });
      }

      return userCredential.user;
    } catch (e) {
      throw e;
    }
  }
}
