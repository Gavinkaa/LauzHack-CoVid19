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
          autovalidate: true,
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "HYNeighbor",
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _firstName,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _firstName = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _lastName,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _lastName = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _email,
                  validator: (input) =>
                      !input.contains('@') ? 'Please Enter valid email' : null,
                  onChanged: (input) => setState(() {
                    _email = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _password,
                  validator: (input) =>
                      input.length < 6 ? 'Must be at least 6 chars' : null,
                  onChanged: (input) => setState(() {
                    _password = input;
                  }),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Telephone',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _telephone,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid number' : null,
                  onChanged: (input) => setState(() {
                    _telephone = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Type: Helper/Asker',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _type,
                  validator: (input) =>
                      !(input.trim() == "Asker" || input.trim() == "Helper")
                          ? 'Please type Helper or Asker'
                          : null,
                  onChanged: (input) => setState(() {
                    _type = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Street',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _street,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _street = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Apt/floor',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _aptfloor,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _aptfloor = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Postal Code',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _pcode,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _pcode = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'City',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _city,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Please Enter valid name' : null,
                  onChanged: (input) => setState(() {
                    _city = input;
                  }),
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
