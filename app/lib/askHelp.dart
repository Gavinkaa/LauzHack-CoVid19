import 'package:flutter/material.dart';

class AskHelp extends StatefulWidget {
  AskHelp({Key key}) : super(key: key);

  final String title = 'Ask Help';

  @override
  _AskHelpState createState() => _AskHelpState();
}

class _AskHelpState extends State<AskHelp> {
  final List<String> _articles = [
    "Pain",
    "Oeufs",
    "Fromage",
    "Yaourts",
    "Steaks hachés",
    "Pâtes",
    "Riz",
    "Poisson",
    "Farine",
    "Lait",
    "Shampoing",
    "Gel douche",
    "Biscuits"
  ]; // A changer pour aller chercher en JSON directement

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<String> _saved = Set<String>();

  Widget _buildArticles() {
    _articles.sort((a, b) => a.toString().compareTo(b.toString()));
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _articles.length,
      itemBuilder: (context, i) {
        return _buildRow(_articles[i]);
      },
    );
  }

  Widget _buildRow(String article) {
    final bool alreadySaved = _saved.contains(article);
    return ListTile(
        title: Text(
          article,
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
      body: _buildArticles(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // Add 20 lines from here...
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String article) {
              return ListTile(
                title: Text(
                  article,
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
