import 'package:firewebauth/auth_service.dart';
import 'package:flutter/material.dart';

class after_login_HomePage extends StatefulWidget {
  after_login_HomePage({Key key}) : super(key: key);
  static final String id = "after_login_HomePage";

  @override
  _after_login_HomePageState createState() => _after_login_HomePageState();
}

class _after_login_HomePageState extends State<after_login_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('bien arrivé')));
  }
}
