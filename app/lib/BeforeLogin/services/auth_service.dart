import 'package:app/AfterLogin/afterLoginHomePage.dart';
import 'package:app/BeforeLogin/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServ {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  static AuthResult authRes;
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
        _firestore.collection('/users').document(signedInUser.uid).setData({
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
        Navigator.pushReplacementNamed(
            context, AfterLoginHomePage.id); // not to be able to come back
      }
    } catch (e) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("ERREUR",
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.red)),
        content: Text("Adresse email déjà utilisée",
            style: TextStyle(fontWeight: FontWeight.w300)),
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

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  static AuthResult getAuth() {
    return authRes;
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

  static bool letterOnly(String text) {
    String p = 
     r'^[a-zA-Z]+$';
     String q = r'^[0-9]*[1-9][0-9]*$';
     RegExp regExp = new RegExp(p);
          RegExp regExp2 = new RegExp(q);


     return !(regExp.hasMatch(text) && !regExp2.hasMatch(text));
  }

  static bool isREALLYaPhoneNumber(String phone) {
    String p =
     r'^((?:\+|00)[17](?: |\-)?|(?:\+|00)[1-9]\d{0,2}(?: |\-)?|(?:\+|00)1\-\d{3}(?: |\-)?)?(0\d|\([0-9]{3}\)|[1-9]{0,3})(?:((?: |\-)[0-9]{2}){4}|((?:[0-9]{2}){4})|((?: |\-)[0-9]{3}(?: |\-)[0-9]{4})|([0-9]{7}))';
     RegExp regExp = new RegExp(p);

     return regExp.hasMatch(phone);

  }
}
