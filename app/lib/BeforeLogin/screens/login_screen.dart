import 'package:app/AfterLogin/afterLoginHomePage.dart';
import 'package:app/BeforeLogin/services/auth_service.dart';
import 'package:app/BeforeLogin/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool logInSucc = false;

  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Login user

      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Erreur"),
        content: Text("Incorrect email or password"),
        actions: [
          okBut,
        ],
      );

      await AuthServ.login(_email, _password)
          .then((value) => logInSucc = value);
      if (logInSucc) {
        Navigator.pushReplacementNamed(context, AfterLoginHomePage.id);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      }
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
              "HelpYourNeighbor",
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w200),
            ),
            Form(
              autovalidate: true,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) => !input.contains('@')
                          ? 'Entrez une adresse e-mail valide'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Mot de passe'),
                      validator: (input) => input.length < 6
                          ? 'Doit faire au moins 6 caractères'
                          : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  ClipRect(
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ClipRect(
                    child: FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignupScreen.id),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300),
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
