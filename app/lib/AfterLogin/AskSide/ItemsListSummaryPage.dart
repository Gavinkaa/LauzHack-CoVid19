import 'package:flutter/material.dart';

import '../Article.dart';

class ItemsListSummaryPage extends StatefulWidget {
  Set<Article> _articles;

  ItemsListSummaryPage(Set<Article> articles, {Key key}) : super(key: key) {
    _articles = articles;
  }

  @override
  _ItemsListSummaryPageState createState() =>
      _ItemsListSummaryPageState(_articles);
}

class _ItemsListSummaryPageState extends State<ItemsListSummaryPage> {
  Set<Article> _articles;
  Iterable<ListTile> _tiles;

  _ItemsListSummaryPageState(Set<Article> _articles) {
    this._articles = _articles;
    _tiles = _articles.map(
      (Article article) {
        return ListTile(
          title: Text(
            article.getName(),
            style: TextStyle(fontSize: 17.0),
          ),
          trailing: GestureDetector(
              onTap: () {
                setState(() {
                  _articles.remove(article);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(Icons.remove_shopping_cart, color: Colors.red),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles enregistrés :'),
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
