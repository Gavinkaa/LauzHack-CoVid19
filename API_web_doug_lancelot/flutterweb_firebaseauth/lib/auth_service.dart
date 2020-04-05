import 'package:flutter/material.dart';
import 'package:firewebauth/home_screen.dart';
import 'package:firewebauth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
//import 'package:help_auth_mob/screens/after_login_screen.dart';
//import 'package:help_auth_mob/screens/login_screen.dart';
//import 'package:API_web_doug_lancelot/firewebauth/_LoginPageState.dart';

//       Navigator.pushReplacementNamed(
//           context, _HomePa.id); // not to be able to come back
//     }
class AuthService {
  static final _auth = FirebaseAuth.instance;

  static final _firestore = firestore();
  //.Firestore.instance;
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
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

  Future<void> register_in_with_error(
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
      AuthResult authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authRes.user; // handles auth
      // handles writing to the db
      if (signedInUser != null) {
        //  //_firestore.collection('/users').document(signedInUser.uid).setData({
        _firestore.collection('/users').doc(signedInUser.uid).set({
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
        //  Navigator.pushReplacementNamed(
        //      context, LoginPage().toString()); // not to be able to come back
      }
    } catch (ERROR_WRONG_PASSWORD) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("The password for this account is invalid"),
        actions: [
          okBut,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    } catch (e) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("The account does not exist, please register"),
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

  Future<void> sign_in_with_error(
      String email, String password, BuildContext context) async {
    try {
      AuthResult authRes = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser signedInUser = authRes.user;
      //if (signedInUser != null) {
      //  _firestore
      //      .collection('/users')
      //      .document(signedInUser.uid)
      //      .setData({'name': name, 'email': email});
      //  Navigator.pushReplacementNamed(
      //      context, AfterLogInScreen.id); // not to be able to come back
      //}
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
