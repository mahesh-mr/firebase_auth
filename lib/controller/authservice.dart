
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  //=================================================================
  //REGISTER=========================================================

  Future<User?> register(
      String password, String email, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  //=====================================================================
  //LOGIN================================================================

  Future<User?> login(
      String password, String email, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseauth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        UserCredential userCredential =
            await firebaseauth.signInWithCredential(credential);
        print(googleAuth);
        print("${googleAuth.accessToken}=======");
        return userCredential.user;
      }
    } catch (e) {
      print(e);
    print("exception");}
  }

  Future singnOut() async {
    await GoogleSignIn().signOut();
    await firebaseauth.signOut();
  }
}
