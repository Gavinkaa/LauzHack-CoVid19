import 'package:firewebauth/auth_service.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
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
  bool _passwordInvisible;
  int radioValue = -1;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Login user
      AuthService.signUpUser(context, _firstName, _lastName, _email, _password,
          _telephone, _type, _street, _aptfloor, _pcode, _city);
    }
  }

  @override
  void initState() {
    _passwordInvisible = true;
    super.initState();
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
                      labelText: 'Prénom',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _firstName,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Entrez un prénom valide' : null,
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
                      labelText: 'Nom',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _lastName,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Entrez un nom valide' : null,
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
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) => !AuthService.isEmail(input)
                      ? 'Entrez un email valide'
                      : null,
                  //insérer ici un regex
                  //input.contains('@') ? 'Entrez un email valide' : null,
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
                      labelText: 'Mot de passe',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            _passwordInvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordInvisible = !_passwordInvisible;
                            });
                          })),
                  initialValue: _password,
                  validator: (input) => input.length < 6
                      ? 'Doit faire au moins 6 caractères'
                      : null,
                  onChanged: (input) => setState(() {
                    _password = input;
                  }),
                  obscureText: _passwordInvisible,
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
                      labelText: 'Téléphone',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _telephone,
                  keyboardType: TextInputType.phone,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Entrez un numéro valide' : null,
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
                      labelText: 'Rue',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _street,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Entrez une adresse valide' : null,
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
                      labelText: "Complément d'adresse",
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _aptfloor,
                  validator: (input) => input.trim().isEmpty
                      ? "Entrez un complément d'adresse valide"
                      : null,
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Code postal',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _pcode,
                  validator: (input) => input.trim().isEmpty
                      ? 'Entrez un code postal valide'
                      : null,
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
                      labelText: 'Ville',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: _city,
                  validator: (input) =>
                      input.trim().isEmpty ? 'Entrez une ville valide' : null,
                  onChanged: (input) => setState(() {
                    _city = input;
                  }),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: Text("Type d'utilisateur :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15.0))),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                              activeColor: Colors.red,
                              hoverColor: Colors.red[600],
                              value: 0,
                              groupValue: radioValue,
                              onChanged: _radioValue,
                            ),
                            GestureDetector(
                              onTap: () {
                                _radioValue(0);
                              },
                              child: Text(
                                "Demandeur d'aide",
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        Row(children: <Widget>[
                          Radio(
                            activeColor: Colors.red,
                            hoverColor: Colors.red[600],
                            value: 1,
                            groupValue: radioValue,
                            onChanged: _radioValue,
                          ),
                          GestureDetector(
                            onTap: () {
                              _radioValue(1);
                            },
                            child: Text(
                              "Aideur",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ]),
                      ])),
              Center(
                child: FlatButton(
                  onPressed: _submit,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }, //Navigator.pop(context),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "RETOUR",
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

  void _radioValue(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _type = "Asker";
          break;
        case 1:
          _type = "Helper";
          break;
      }
    });
  }
}
