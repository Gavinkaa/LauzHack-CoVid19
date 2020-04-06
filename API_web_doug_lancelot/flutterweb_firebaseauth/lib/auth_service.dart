import 'package:firewebauth/AfterLoginHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firewebauth/login_screen.dart';
import 'package:firewebauth/AfterLoginHomePage.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase/firebase.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static AuthResult authRes;

  static final _firestore = firestore();
  //.Firestore.instance;
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AfterLoginHomePage();
        } else {
          //modified for :
          return LoginPage();
          //return FirstRoute();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //new methode from their class
  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> sign_in_with_error(
      String email, String password, BuildContext context) async {
    try {
      AuthResult authRes = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authRes.user;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AfterLoginHomePage()));
      //Navigator.push(
      //  context,
      //  MaterialPageRoute(builder: (context) => AfterLoginHomePage()),
      //);

      //if (signedInUser != null) {
      //  _firestore
      //      .collection('/users')
      //      .document(signedInUser.uid)
      //      .setData({'name': name, 'email': email});
      //  }
    } catch (e) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("Email already used"),
        actions: [
          okBut,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }

  static void signUpUser(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      String password,
      String telephone,
      String type,
      String street,
      String aptfloor,
      String pcode,
      String city) async {
    try {
      authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authRes.user; // handles auth
      // handles writing to the db
      if (signedInUser != null) {
        _firestore.collection('/users').doc(signedInUser.uid).set({
          'userId': authRes.user.uid,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'telephone': telephone,
          'type': type,
          'street': street,
          'aptFloor': aptfloor,
          'pcode': pcode,
          'city': city
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AfterLoginHomePage()));
        //Navigator.push(
        //  context,
        //  MaterialPageRoute(builder: (context) => AfterLoginHomePage()),
        //);
        // Navigator.pushReplacementNamed(
        //     context, AfterLoginHomePage.id); // not to be able to come back
      }
    } catch (e) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("Email already used"),
        actions: [
          okBut,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }
}

class BuilderContext {}
