import 'package:flutter/material.dart';

import '../API_requests.dart';
import '../Article.dart';

class createArticlePage extends StatefulWidget {
  Set<Article> _saved;
  Article createdArticle;

  createArticlePage(Set<Article> saved, {Key key}) : super(key: key) {
    _saved = saved;
  }

  @override
  _createArticlePageState createState() => _createArticlePageState();
}

class _createArticlePageState extends State<createArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.green,
            onPressed: () => Navigator.of(context).pop(),
            icon: new Icon(Icons.save, color: Colors.white),
            label: Text("SAUVEGARDER",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.white))),
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('CRÉER UN NOUVEL ARTICLE',
              style: TextStyle(fontWeight: FontWeight.w300)),
          centerTitle: true,
        ));
  }
}
