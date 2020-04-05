import 'package:app/AskSide/ItemsListSummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'Articles.dart';

class ItemsListPage extends StatefulWidget {
  ItemsListPage({Key key}) : super(key: key);

  @override
  _ItemsListPageState createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {
  Map<ArticleType, List<Article>> _articlesByType;

  Future<void> loadArticlesfromJson() async {
    var jsonData = await rootBundle.loadString('assets/articles.json');
    setState(() {
      _articlesByType = Article.jsonToMap(json.decode(jsonData));
      // Map<String, List<Map<String, String>>>
    });
  }

  @override
  void initState() {
    loadArticlesfromJson();
    super.initState();
  }

  final _fontArticles = const TextStyle(fontSize: 17.0);
  final _fontTypes = const TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w200,
  );
  final Set<Article> _saved = Set<Article>();

  Widget _buildTypes() {
    if (_articlesByType != null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _articlesByType.length,
        itemBuilder: (context, i) {
          List<ArticleType> types = _articlesByType.keys.toList();
          return ExpansionTile(
            title: Text(types[i].getStr(), style: _fontTypes),
            children: <Widget>[
              Column(
                children: _buildArticles(_articlesByType[types[i]]),
              )
            ],
          );
        },
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  List<Widget> _buildArticles(List<Article> articles) {
    if (_articlesByType != null) {
      List<Widget> articlesWidgets = [];

      for (int i = 0; i < articles.length; i++) {
        articlesWidgets.add(_buildRow(articles[i]));
      }

      return articlesWidgets;
    } else {
      return [CircularProgressIndicator()];
    }
  }

  Widget _buildRow(Article article) {
    final bool alreadySaved = _saved.contains(article);
    return ListTile(
        title: Text(
          article.getName(),
          style: _fontArticles,
        ),
        trailing: Icon(
          alreadySaved ? Icons.check_circle : Icons.add_shopping_cart,
          color: alreadySaved ? Colors.green : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(article);
            } else {
              _saved.add(article);
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votre demande :'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.deepOrange,
                size: 30.0,
              ),
              onPressed: _pushSaved),
        ],
      ),
      body: Container(
        child: _buildTypes(),
        alignment: Alignment.center,
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ItemsListSummaryPage(_saved),
          ),
        )
        .then((value) => setState(() {}));
  }
}
