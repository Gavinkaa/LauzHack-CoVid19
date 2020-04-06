import 'package:app/AfterLogin/AskSide/ItemsListSummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'createArticlePage.dart';
import '../Article.dart';

class ItemsListPage extends StatefulWidget {
  ItemsListPage({Key key}) : super(key: key);
  ItemsListPage.withInitsaved(Set<Article> saved, {Key key}) : super(key: key) {
    this._saved = Set.from(saved);
  }
  Set<Article> _saved = Set<Article>();

  @override
  _ItemsListPageState createState() => _ItemsListPageState(_saved);
}

class _ItemsListPageState extends State<ItemsListPage> {
  Map<ArticleType, List<Article>> _articlesByType;
  Set<Article> _saved;
  List<Article> _articles = [];
  List<ArticleType> _types = [];

  _ItemsListPageState(Set<Article> saved) {
    this._saved = saved;
  }

  Future<void> loadArticlesfromJson() async {
    var jsonData = await rootBundle.loadString('assets/articles.json');
    Map<ArticleType, List<Article>> a =
        Article.jsonToMap(json.decode(jsonData));
    List<Article> articles = [];
    List<ArticleType> t = a.keys.toList();
    for (int i = 0; i < t.length; i++) {
      for (int j = 0; j < a[t[i]].length; j++) {
        articles.add(a[t[i]][j]);
      }
    }
    setState(() {
      _articlesByType = a;
      _types = t;
      _articles = articles;
    });
  }

  @override
  void initState() {
    loadArticlesfromJson();
    super.initState();
  }

  final _fontArticles =
      const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300);
  final _fontTypes = const TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w200,
  );

  Widget _buildTypes() {
    if (_articlesByType != null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _articlesByType.length,
        itemBuilder: (context, i) {
          return ExpansionTile(
            title: Text(_types[i].toString(), style: _fontTypes),
            children: <Widget>[
              Column(
                children: _buildArticles(_articlesByType[_types[i]]),
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
              article.setQuantity(1);
              _saved.add(article);
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: _pushCreateNewArticle,
          child: new Icon(Icons.add, color: Colors.white)),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'VOTRE COMMANDE',
          style: TextStyle(fontWeight: FontWeight.w300),
          textAlign: TextAlign.end,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ArticleSearch(_articles, _saved, this));
            },
          ),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.green,
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

  void _pushCreateNewArticle() {
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => createArticlePage(),
          ),
        )
        .then((value) => setState(() {}));
  }
}

// A MODIFIER POUR CORRIGER L'AFFICHAGE !!!
class ArticleSearch extends SearchDelegate<Article> {
  List<Article> _l;
  final List<Article> recent = [];
  Set<Article> _s;
  _ItemsListPageState _iLPS;

  ArticleSearch(this._l, this._s, this._iLPS);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return ListView.builder(
      itemBuilder: (context, index) {
        final bool _alreadySaved = _s.contains(_l[index]);
        return ListTile(
          onTap: () {
            _iLPS.setState(() {
              if (_alreadySaved) {
                _s.remove(_l[index]);
              } else {
                _s.add(_l[index]);
              }
            });
            showResults(context);
          },
          title: RichText(
              text: TextSpan(
                  text: _l[index].getName().substring(0, query.length),
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    text: _l[index].getName().substring(query.length),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0))
              ])),
          trailing: Icon(
            _alreadySaved ? Icons.check_circle : Icons.add_shopping_cart,
            color: _alreadySaved ? Colors.green : null,
          ),
        );
      },
      itemCount: _l.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recent
        : _l
            .where((a) =>
                a.getName().toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final bool _alreadySaved = _s.contains(_l[index]);
        return ListTile(
          onTap: () {
            _iLPS.setState(() {
              if (_alreadySaved) {
                _s.remove(_l[index]);
              } else {
                _s.add(_l[index]);
              }
            });
            showResults(context);
          },
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index]
                      .getName()
                      .substring(0, query.length),
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    text:
                        suggestionList[index].getName().substring(query.length),
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300))
              ])),
          trailing: Icon(
            _alreadySaved ? Icons.check_circle : Icons.add_shopping_cart,
            color: _alreadySaved ? Colors.green : null,
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
