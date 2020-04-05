import 'package:firewebauth/auth_service.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String email,
      password,
      firstName,
      lastName,
      telephone,
      type,
      street,
      aptfloor,
      pcode,
      city;

  final formKey = new GlobalKey<FormState>();

  Padding add_Box(String field, String type) {
    return Padding(
        padding:
            EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
        child: Container(
          height: 32.0,
          child: TextFormField(
            initialValue: field,
            //to think about
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: type,
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                )),
            validator: (value) => value.isEmpty ? type + ' is required' : null,
            onChanged: (value) => setState(() {
              field = value;
            }),
          ),
        ));
  }

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
                                  initialValue: email,
                                  decoration:
                                      InputDecoration(hintText: 'Email'),
                                  validator: (value) => value.isEmpty
                                      ? 'Email is required'
                                      : validateEmail(value.trim()),
                                  onChanged: (value) => setState(() {
                                    this.email = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: password,
                                  //to think about
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'password',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for password
                                      value.isEmpty 
                                          ? 'password is required' : value.length < 6 ? 'Must be at least 6 characters'
                                          : null,
                                  onChanged: (value) => setState(() {
                                    password = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: firstName,
                                  //to think about
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'first name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //add cehcking condition
                                      value.isEmpty
                                          ? 'First Name is required' : value.contains("1") || value.contains("2") || value.contains("3") || value.contains("4") || value.contains("5") || value.contains("6") || value.contains("7") || value.contains("8") || value.contains("9") || value.contains("0") ?  "First Name cannot contains numbers"
                                          : null,
                                  onChanged: (value) => setState(() {
                                    firstName = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: lastName,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'last Name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for last name
                                      value.isEmpty
                                          ? 'Last Name is required' : value.contains("1") || value.contains("2") || value.contains("3") || value.contains("4") || value.contains("5") || value.contains("6") || value.contains("7") || value.contains("8") || value.contains("9") || value.contains("0") ?  "Last Name cannot contains numbers"
                                          : null,
                                  onChanged: (value) => setState(() {
                                    lastName = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: telephone,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'phone number',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for phone
                                      value.isEmpty
                                          ? 'phone number is required' : value.length != 10 ?  "your phone number must have ten digits"
                                          : null,
                                  onChanged: (value) => setState(() {
                                    telephone = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: type,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'type',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for type
                                      value.isEmpty ? 'type is required' : null,
                                  onChanged: (value) => setState(() {
                                    type = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: street,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'street name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for street
                                      value.isEmpty
                                          ? 'street name is required'
                                          : null,
                                  onChanged: (value) => setState(() {
                                    street = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: aptfloor,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'aptfloor',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for aptflorr
                                      value.isEmpty
                                          ? 'aptfloor is required' : !(value.contains("1") || value.contains("2") || value.contains("3") || value.contains("4") || value.contains("5") || value.contains("6") || value.contains("7") || value.contains("8") || value.contains("9") || value.contains("0")) ?  "aptfloor must contains numbers"
                                          : null,
                                  onChanged: (value) => setState(() {
                                    aptfloor = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: pcode,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'c_postal',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for pcode
                                      value.isEmpty
                                          ? 'c_postal is required' : !(value.contains("1") || value.contains("2") || value.contains("3") || value.contains("4") || value.contains("5") || value.contains("6") || value.contains("7") || value.contains("8") || value.contains("9") || value.contains("0")) ?  "c_postal must contains numbers"
                                          : null,
                                  onChanged: (value) => setState(() {
                                    pcode = value;
                                  }),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 32.0,
                                child: TextFormField(
                                  initialValue: city,
                                  //to think about
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      labelText: 'City',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                  validator: (value) =>
                                      //check condition for city
                                      value.isEmpty ? 'city is required' : null,
                                  onChanged: (value) => setState(() {
                                    city = value;
                                  }),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (checkFields()) {
                                  //AuthService().signIn(email, password);
                                  AuthService().register_in_with_error(
                                      this.context,
                                      this.firstName,
                                      this.lastName,
                                      this.email,
                                      password,
                                      this.telephone,
                                      this.type,
                                      this.street,
                                      this.aptfloor,
                                      this.pcode,
                                      this.city);
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
