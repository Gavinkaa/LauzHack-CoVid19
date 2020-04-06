import 'package:app/AfterLogin/AskSide/pictureTakerPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../API_requests.dart';
import '../Article.dart';
import '../Contact.dart';
import '../Request.dart';
import 'itemsListPage.dart';

class AskHelpPage extends StatefulWidget {
  AskHelpPage({Key key}) : super(key: key);

  final String title = "DEMANDER DE L'AIDE";

  @override
  _AskHelpPageState createState() => _AskHelpPageState();
}

class _AskHelpPageState extends State<AskHelpPage> {
  Request _myRequests;

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

  Widget _myRequest() {
    return _myRequests != null
        ? Container(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemsListPage.withInitsaved(
                              _myRequests.getArticles().toSet())));
                },
                child: _myRequests.widgetAsker(false),
              ),
            ),
          )
        : Container();
  }

  Future<void> _initRequests() async {
    Request requests;

    Map<String, dynamic> request = await APIRequests.GET_userOrder();

    Contact contact =
        Contact.fromJSON(request["contact"].cast<String, String>());
    List<Article> articles = [];

    Map<String, dynamic> order = request["order"].cast<String, dynamic>();

    Article.jsonToMap(order).forEach((type, list) {
      articles.addAll(list);
    });

    requests = Request(articles, contact, request["orderID"]);

    setState(() {
      _myRequests = requests;
    });
  }

  @override
  void initState() {
    super.initState();
    _initRequests();
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
            _myRequest(),
            RaisedButton(
              onPressed: () {
                if (!kIsWeb) {
                  _showDialogToSelectShopMode(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemsListPage()),
                  ).then((value) => setState(() {
                        _myRequests = Request.from(_myRequests);
                      }));
                }
              },
              child: Row(
                children: <Widget>[
                  Text(
                    'CREER UNE LISTE DE COURSES',
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.add, color: Colors.white, size: 30.0)
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
