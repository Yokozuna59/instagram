import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future reg(String email, String password) async {
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e);
    }
  }

  static Future signIn(email, password) async {
    try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  static User getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}