import 'dart:convert';

import 'package:app/AfterLogin/API_requests.dart';
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
            RaisedButton(
                onPressed: () {
                  APIRequests.POST_NewRequest({
                    "contact": {
                      "firstName": "",
                      "lastName": "",
                      "email": "",
                      "phone": "",
                      "type": "",
                      "street": "",
                      "aptFloor": "",
                      "pcode": "",
                      "city": "",
                      "accepted_orders": ["id1", "id2"]
                    },
                    "order": {
                      "Viande": [
                        {
                          "name": "",
                          "comment": "",
                          "quantity": "",
                          "icon-url": ""
                        }
                      ],
                      "type2_ex": [
                        {
                          "name": "",
                          "comment": "",
                          "quantity": "",
                          "icon-url": ""
                        }
                      ]
                    }
                  });
                },
                child: Text('POST LIST')),
            RaisedButton(
                onPressed: () {
                  //orderid, person id who place id;
                  APIRequests.POST_AcceptRequest("UBbuBsPoiOUU9MfeFgT9UnGWdE93",
                      "UBbuBsPoiOUU9MfeFgT9UnGWdE93");
                },
                child: Text('AcceptOrder')),
            // RaisedButton(
            //     onPressed: () async {
            //       //orderid, person id who place id;
            //       List<String> accepted =
            //           await APIRequests.GET_listOfRequestsAccepted();
            //       List<String> nonaccepted =
            //           await APIRequests.GET_listOfRequestsNotAccepted();
            //       print("\n\n" +
            //           accepted.toString() +
            //           "\n\n" +
            //           nonaccepted.toString());
            //     },
            //     child: Text('getListRequests')),
          ],
        ),
      ),
    );
  }
}
