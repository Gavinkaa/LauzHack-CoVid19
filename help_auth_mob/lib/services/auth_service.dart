import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_auth_mob/screens/after_login_screen.dart';
import 'package:help_auth_mob/screens/login_screen.dart';

class AuthServ {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authRes.user;
      if (signedInUser != null) {
        _firestore
            .collection('/users')
            .document(signedInUser.uid)
            .setData({'name': name, 'email': email});
        Navigator.pushReplacementNamed(
            context, AfterLogInScreen.id); // not to be able to come back
      }
    } catch (e) {
      print(e);
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static void login(BuildContext context, String email, String password) {
    _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
