import 'package:flutter/material.dart';
import 'Article.dart';
import 'Contact.dart';

class Request {
  List<Article> _articles;
  int _nbOfArticles;
  Contact _asker;
  String _requestID;

  Request(List<Article> articles, Contact asker, String requestID) {
    this._articles = List.from(articles);
    this._asker = Contact.from(asker);
    this._nbOfArticles = _articles.length;
    this._requestID = requestID;
  }

  List<Article> getArticles() {
    return List.from(_articles);
  }

  int getNumberOfArticles() {
    return _nbOfArticles;
  }

  Contact getAsker() {
    return Contact.from(_asker);
  }

  String getRequestID() {
    return _requestID;
  }

  void setArticles(List<Article> articles) {
    this._articles = List.from(_articles);
    this._nbOfArticles = _articles.length;
  }

  void setAsker(Contact asker) {
    this._asker = Contact.from(asker);
  }

  Widget widget() {
    return Card(
      elevation: 4.0,
      color: Colors.transparent,
      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: Container(
        constraints: BoxConstraints(maxWidth: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 3.0),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _asker.getFirstName(),
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                _asker.getCity(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                  _nbOfArticles == 1
                      ? "1 article"
                      : _nbOfArticles.toString() + " articles",
                  // textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w200))
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
