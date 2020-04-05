import 'package:firewebauth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool hasMatch(String input) {
    return false;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //end modifies
        body: Center(
            child: Container(
                height: 400.0,
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Email'),
                                    validator: (value) => value.isEmpty
                                        ? 'Email is required'
                                        : validateEmail(value.trim()),
                                    onChanged: (value) {
                                      this.email = value;
                                    },
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration:
                                        InputDecoration(hintText: 'Password'),
                                    validator: (value) => value.isEmpty
                                        ? 'Password is required'
                                        : null,
                                    onChanged: (value) {
                                      this.password = value;
                                    },
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  if (checkFields()) {
                                    AuthService().sign_in_with_error(
                                        email, password, context);
                                  }
                                },
                                child: Container(
                                    height: 40.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                    ),
                                    child: Center(child: Text('Sign in'))))
                          ],
                          //navigator.push -> pas de go cack
                        )),
                    RaisedButton(
                      child: Text('I want to register'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      },
                    ),
                  ],
                ))));
  }
}

class SecondRoute extends StatelessWidget {
  String email = 'email';
  String password = 'password',
      firstName = 'firstName',
      lastName = 'lastName',
      telephone = 'telephone',
      type = 'type',
      street = 'street',
      aptfloor = 'aptfloor',
      pcode = 'pcode',
      city = 'city';

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              height: 900.0,
              width: 300.0,
              child: Column(
                children: <Widget>[
                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 50.0,
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: 'Email'),
                                  validator: (value) => value.isEmpty
                                      ? 'Email is required'
                                      : validateEmail(value.trim()),
                                  onChanged: (value) {
                                    this.email = value;
                                  },
                                ),
                              )),
                          add_Box(this.password, password),
                          add_Box(this.firstName, firstName),
                          add_Box(this.lastName, lastName),
                          add_Box(this.telephone, telephone),
                          add_Box(this.type, type),
                          add_Box(this.street, street),
                          add_Box(this.aptfloor, aptfloor),
                          add_Box(this.pcode, pcode),
                          add_Box(this.city, city),
                          InkWell(
                              onTap: () {
                                if (checkFields()) {
                                  //AuthService().signIn(email, password);
                                  AuthService().register_in_with_error(
                                      context,
                                      firstName,
                                      lastName,
                                      email,
                                      password,
                                      telephone,
                                      type,
                                      street,
                                      aptfloor,
                                      pcode,
                                      city);
                                }
                              },
                              child: Container(
                                  height: 40.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                  ),
                                  child: Center(child: Text('register in'))))
                        ],
                        //navigator.push -> pas de go cack
                      )),
                  RaisedButton(
                    child: Text('Go back to login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ))),
    );
  }
}
