import 'package:flutter/material.dart';

class AskHelp extends StatefulWidget {
  AskHelp({Key key}) : super(key: key);

  final String title = 'Ask Help';

  @override
  _AskHelpState createState() => _AskHelpState();
}

class _AskHelpState extends State<AskHelp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      ),
    );
  }
}
