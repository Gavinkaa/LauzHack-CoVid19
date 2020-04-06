import 'package:firewebauth/auth_service.dart';
import 'package:firewebauth/login_screen.dart';
import 'package:flutter/material.dart';

class AfterLoginHomePage extends StatefulWidget {
  static final String id = "after_login_screen";
  AfterLoginHomePage({Key key}) : super(key: key);

  @override
  _AfterLoginHomePageState createState() => _AfterLoginHomePageState();
}

class _AfterLoginHomePageState extends State<AfterLoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 400.0,
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('log out'),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        //Navigator.push(
                        //  context,
                        //  MaterialPageRoute(builder: (context) => LoginPage()),
                        //);
                      },
                    ),
                  ],
                ))));
  }
}
