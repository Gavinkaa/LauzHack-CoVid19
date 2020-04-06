import 'package:flutter/material.dart';

import '../API_requests.dart';
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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('ARTICLES ENREGISTRÉS :'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("VALIDER LA COMMANDE ?",
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    content:
                        Text("Êtes vous sûr de voulour valider la commande ?"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("ANNULER",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.red))),
                      FlatButton(
                          onPressed: () {
                            //return to "askHelpPage"
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

                            Map<ArticleType, List<Article>> articles = {};

                            _articles.forEach((a) {
                              articles.putIfAbsent(
                                  a.getArticleType(), () => []);
                              articles[a.getArticleType()].add(a);
                            });

                            APIRequests.POST_NewRequest(
                                {"order": Article.toJSON(articles)});
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
