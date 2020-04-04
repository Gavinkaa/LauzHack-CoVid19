import 'package:flutter/foundation.dart';
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
  Future<void> _showDialogToSelectShopMode(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Make a list"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemsList()),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                GestureDetector(
                  child: Text("Add a picture"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PictureTaker()),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
                  if (!kIsWeb) {
                    _showDialogToSelectShopMode(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemsList()),
                    );
                  }
                },
                child: Text('Items list')),
          ],
        ),
      ),
    );
  }
}
