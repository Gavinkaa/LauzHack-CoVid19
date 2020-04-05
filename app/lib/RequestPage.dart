import 'Request.dart';
import 'package:flutter/material.dart';
import 'AskSide/Articles.dart';

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
  List<Article> _articlesFromRequest;

  _RequestPageState(Request request) {
    this._request = request;
    _articlesFromRequest = _request.getArticles();
  }

  final _fontArticles =
      const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w200);
  final Set<Article> _picked = Set<Article>();

  List<Widget> _buildArticles(List<Article> articles) {
    if (_articlesFromRequest != null) {
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
    final bool alreadyPicked = _picked.contains(article);
    return ListTile(
        title: Text(
          article.getName(),
          style: _fontArticles,
        ),
        trailing: Icon(
          alreadyPicked ? Icons.check_circle : Icons.check_circle_outline,
          color: alreadyPicked ? Colors.green : null,
        ),
        onTap: () {
          setState(() {
            if (alreadyPicked) {
              _picked.remove(article);
            } else {
              _picked.add(article);
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demande de " + _request.getAsker().getFirstName()),
      ),
      body: Column(
        children: _buildArticles(_articlesFromRequest),
      ),
    );
  }
}
