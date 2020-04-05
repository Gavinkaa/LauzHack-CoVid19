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
      _articlesByType = Article.dataToMap(json.decode(jsonData));
      print("\n\n" + (_articlesByType.keys.length).toString() + "\n\n");
      // Map<String, List<Map<String, String>>>
    });
  }

  @override
  void initState() {
    loadArticlesfromJson();
    super.initState();
  }

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<Article> _saved = Set<Article>();

  Widget _buildTypes() {
    if (_articlesByType != null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _articlesByType.length,
        itemBuilder: (context, i) {
          List<ArticleType> types = _articlesByType.keys.toList();
          return ExpansionTile(
            title: Text(types[i].getStr()),
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
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
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
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: Container(
        child: _buildTypes(),
        alignment: Alignment.center,
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // Add 20 lines from here...
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (Article article) {
              return ListTile(
                title: Text(
                  article.getName(),
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Articles enregistrés :'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
