import 'package:flutter/material.dart';
import 'package:help_auth_mob/services/auth_service.dart';

class AfterLogInScreen extends StatefulWidget {
  static final String id = "after_login_screen";

  @override
  _AfterLogInScreenState createState() => _AfterLogInScreenState();
}

class _AfterLogInScreenState extends State<AfterLogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: FlatButton(
            onPressed: () => AuthServ.logout(context),
            child: Text("Logout"),
          ),
        ));
  }
}
