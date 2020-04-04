import 'package:firebase_auth/firebase_auth.dart';
import 'package:firewebauth/home_screen.dart';
import 'package:firewebauth/login_screen.dart';
import 'package:flutter/material.dart';

class AuthService {
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

  Future<void> sign_in_with_error(
      String email, String password, BuildContext context) async {
    try {
      AuthResult authRes = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser signedInUser = authRes.user;
      //if (signedInUser != null) {
      //  _firestore
      //      .collection('/users')
      //      .document(signedInUser.uid)
      //      .setData({'name': name, 'email': email});
      //  Navigator.pushReplacementNamed(
      //      context, AfterLogInScreen.id); // not to be able to come back
      //}
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

  Future<void> register_in_with_error(
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
