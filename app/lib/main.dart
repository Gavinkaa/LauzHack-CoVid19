import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'AfterLogin/afterLoginHomePage.dart';
import 'BeforeLogin/screens/login_screen.dart';
import 'BeforeLogin/screens/signup_screen.dart';
import 'BeforeLogin/webSide/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return AfterLoginHomePage();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (!kIsWeb)
        ? MaterialApp(
            title: 'Login helper',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.white),
            home: _getScreenId(),
            routes: {
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                AfterLoginHomePage.id: (context) => AfterLoginHomePage(),
              })
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthService().handleAuth());
  }
}
