import 'package:app/itemsList.dart';
import 'package:app/pictureTaker.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemsList()),
                  );
                },
                child: Text('Items list')),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PictureTaker()),
                  );
                },
                child: Text('Picture taker')),
          ],
        ),
      ),
    );
  }
}
