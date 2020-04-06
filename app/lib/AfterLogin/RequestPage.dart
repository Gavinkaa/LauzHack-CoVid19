import 'package:app/AfterLogin/API_requests.dart';

import 'Article.dart';
import 'Request.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  Request _request;
  RequestPage(Request request, {Key key}) : super(key: key) {
    this._request = request;
  }

  @override
  _RequestPageState createState() => _RequestPageState(_request);
}

class _RequestPageState extends State<RequestPage> {
  Request _request;
  Set<Article> _articlesFromRequest;
  Iterable<ListTile> _tiles;
  final Set<Article> _picked = Set<Article>();
  bool alreadyPicked;

  _RequestPageState(Request request) {
    this._request = request;
    _articlesFromRequest = _request.getArticles().toSet();
    _tiles = _articlesFromRequest.map((Article article) {
      alreadyPicked = _picked.contains(article);
      return ListTile(
        title: Text(
          article.getName(),
          style: _fontArticles,
        ),
        trailing: GestureDetector(
            onTap: () {
              setState(() {
                if (alreadyPicked) {
                  _picked.remove(article);
                } else {
                  _picked.add(article);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                  alreadyPicked
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: alreadyPicked ? Colors.green : null),
            )),
      );
    });
  }

  final _fontArticles =
      const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "DEMANDE DE " + _request.getAsker().getFirstName().toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w200)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Accepter la demande ?"),
                    content: Text(
                        "Etes-vous sûr de vouloir prendre en charge cette demande ?"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Annuler")),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            //orderid, person id who place id;
                            APIRequests.POST_AcceptRequest(
                                "UBbuBsPoiOUU9MfeFgT9UnGWdE93",
                                "UBbuBsPoiOUU9MfeFgT9UnGWdE93");
                          },
                          child: Text("Accepter")),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.assignment_turned_in,
              color: Colors.green,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: _tiles,
        ).toList(),
      ),
    );
  }
}
