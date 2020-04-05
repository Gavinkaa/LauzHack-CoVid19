import 'package:app/BeforeLogin/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_sceen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName,
      _lastName,
      _email,
      _password,
      _telephone,
      _type,
      _street,
      _aptfloor,
      _pcode,
      _city;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Login user
      AuthServ.signUpUser(context, _firstName, _lastName, _email, _password,
          _telephone, _type, _street, _aptfloor, _pcode, _city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Helper App',
                style: TextStyle(fontSize: 50.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _firstName = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _lastName = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@')
                        ? 'Please Enter valid email'
                        : null,
                    onSaved: (input) => _email = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (input) =>
                        input.length < 6 ? 'Must be at least 6 chars' : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Telephone'),
                    validator: (input) => input.trim().isEmpty
                        ? 'Please Enter valid number'
                        : null,
                    onSaved: (input) => _telephone = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Type: Helper/Asker'),
                    validator: (input) =>
                        !(input.trim() == "Asker" || input.trim() == "Helper")
                            ? 'Please type Helper or Asker'
                            : null,
                    onSaved: (input) => _type = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Street'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _street = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Apt/floor'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _aptfloor = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Postal Code'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _pcode = input,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please Enter valid name' : null,
                    onSaved: (input) => _city = input,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: _submit,
                color: Colors.red,
                child: Text(
                  'Signup',
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
                onPressed: () => Navigator.pop(context),
                color: Colors.red,
                child: Text(
                  'Back to Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
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
