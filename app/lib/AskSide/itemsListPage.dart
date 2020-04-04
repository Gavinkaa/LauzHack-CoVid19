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
  List<Article> _articles;

  Future<void> loadArticlesfromJson() async {
    var jsonData = await rootBundle.loadString('assets/articles.json');
    setState(() {
      _articles = Article.dataToSortedList(json.decode(jsonData));
    });
  }

  @override
  void initState() {
    loadArticlesfromJson();
    super.initState();
  }

  // final List<String> _articles = [
  //   "Pain",
  //   "Oeufs",
  //   "Fromage",
  //   "Yaourts",
  //   "Steaks hachés",
  //   "Pâtes",
  //   "Riz",
  //   "Poisson",
  //   "Farine",
  //   "Lait",
  //   "Shampoing",
  //   "Gel douche",
  //   "Biscuits"
  // ]; // A changer pour aller chercher en JSON directement

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<Article> _saved = Set<Article>();

  Widget _buildArticles() {
    if (_articles != null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _articles.length,
        itemBuilder: (context, i) {
          return _buildRow(_articles[i]);
        },
      );
    } else {
      return CircularProgressIndicator();
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
        child: _buildArticles(),
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