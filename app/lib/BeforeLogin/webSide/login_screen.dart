import 'package:app/AfterLogin/afterLoginHomePage.dart';
import 'package:app/BeforeLogin/webSide/auth_service.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

      await AuthService.login(_email, _password)
          .then((value) => logInSucc = value);
      if (logInSucc) {
        //Navigator.push(
        //  context,
        //  MaterialPageRoute(builder: (context) => AfterLoginHomePage()),
        //);
        //Navigator.pushReplacementNamed(context, AfterLoginHomePage.id);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AfterLoginHomePage()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      }
    }
  }

  //checkFields() {
  //  final form = formKey.currentState;
  //  if (form.validate()) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}

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
      body: Center(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  "HYNeighbor",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) => !AuthService.isEmail(input)
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
                  decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
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
              Center(
                child: FlatButton(
                  onPressed: _submit,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'SE CONNECTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SecondRoute()));
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(builder: (context) => SecondRoute()),
                    //);
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "S'INSCRIRE",
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
      ),
    );
  }
}
