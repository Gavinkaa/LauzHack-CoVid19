import 'package:firewebauth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
//  assert(()
  fb.initializeApp(
    apiKey: "AIzaSyCiaWly8EX1DgMwv7S6BSRI6Tamqwdz3dY",
    authDomain: "helpneighbor-6a8d3.firebaseapp.com",
    databaseURL: "https://helpneighbor-6a8d3.firebaseio.com",
    projectId: "helpneighbor-6a8d3",
    storageBucket: "helpneighbor-6a8d3.appspot.com",
    messagingSenderId: "261992976571",
    appId: "1:261992976571:web:f2478a36ba5320d0b5999e",
    measurementId: "G-QZJXSH7S8F",
  );
  //BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp()); //)
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AuthService().handleAuth());
  }
}
