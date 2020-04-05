import 'package:flutter/material.dart';

class SignUpFormScreen extends StatefulWidget {
  @override
  _SignUpFormScreenState createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final fielsToDo = [
    'First Name',
    'Last Name',
    'Email',
    'Password',
    'Street',
    'City',
    'Postal Code',
    'User type'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fielsToDo.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(fielsToDo[index]));
      },
    );
  }
}
