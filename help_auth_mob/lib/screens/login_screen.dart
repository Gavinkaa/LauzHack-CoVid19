import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_auth_mob/screens/signup_screen.dart';
import 'package:help_auth_mob/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
      // Login user
      AuthServ.login(context, _email, _password);
      print("login succ!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Helper App',
              style: TextStyle(fontSize: 50.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@')
                        ? 'Please Enter valid email'
                        : null,
                    onSaved: (input) => _email = input,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (input) =>
                        input.length < 6 ? 'Must be at least 6 chars' : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: _submit,
                    color: Colors.red,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SignupScreen.id),
                    color: Colors.red,
                    child: Text(
                      'Go to sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
