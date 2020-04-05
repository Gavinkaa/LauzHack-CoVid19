import 'package:app/AfterLogin/AskSide/pictureTakerPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'itemsListPage.dart';

class AskHelpPage extends StatefulWidget {
  AskHelpPage({Key key}) : super(key: key);

  final String title = "Demander de l'aide";

  @override
  _AskHelpPageState createState() => _AskHelpPageState();
}

class _AskHelpPageState extends State<AskHelpPage> {
  Future<void> _showDialogToSelectShopMode(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choisis une méthode :"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Créer une liste de courses"),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemsListPage()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text("Prendre une photo de ma liste de course"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PictureTakerPage()),
                      );
                    },
                  ),
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
                      MaterialPageRoute(builder: (context) => ItemsListPage()),
                    );
                  }
                },
                child: Text('Créer une liste de courses')),
          ],
        ),
      ),
    );
  }
}
