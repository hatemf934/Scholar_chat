// ignore_for_file: use_build_context_synchronously

import 'package:chatsapp/helper/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSevices {
  Future<void> loginAuth(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, "chat", arguments: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        snackBar(
            context, "Network error. Please check your internet connection.");
      } else if (e.code == 'invalid-credential') {
        snackBar(context,
            "The supplied auth credential is incorrect email or password");
      }
    } catch (e) {
      snackBar(context, e.toString());
    }
  }

  Future<void> regesterAuth(
      BuildContext context, String email, String password) async {
    try {
      // UserCredential user
      // =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBar(context, "weak password");
      } else if (e.code == 'email-already-in-use') {
        snackBar(context, "emaill already in use");
      }
    } catch (e) {
      snackBar(context, e.toString());
    }
  }
}
