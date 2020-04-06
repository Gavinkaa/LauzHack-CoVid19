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

  static void signUpUser(
      BuildContext context,
      String _firstName,
      String _lastName,
      String _email,
      String _password,
      String _telephone,
      String _type,
      String _street,
      String _aptfloor,
      String _pcode,
      String _city) async {
    try {
      authRes = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      FirebaseUser signedInUser = authRes.user; // handles auth
      // handles writing to the db
      if (signedInUser != null) {
        _firestore.collection('/users').doc(signedInUser.uid).set({
          'userId': authRes.user.uid,
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
          'telephone': _telephone,
          'type': _type,
          'street': _street,
          'aptFloor': _aptfloor,
          'pcode': _pcode,
          'city': _city
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

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  static bool isPhoneNumber(String phone) {
    String p =
     r'^[0-9]*[1-9][0-9]*$';
     RegExp regExp = new RegExp(p);

     return regExp.hasMatch(phone);

  }
}

class BuilderContext {}
