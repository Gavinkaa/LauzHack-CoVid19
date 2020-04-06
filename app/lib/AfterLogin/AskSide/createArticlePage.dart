import 'package:flutter/material.dart';
import '../Article.dart';
import '../../BeforeLogin/services/auth_service.dart';

class createArticlePage extends StatefulWidget {
  static final String id = 'create_article';
  Set<Article> _saved;
  List<ArticleType> _types;

  createArticlePage(Set<Article> saved, List<ArticleType> types, {Key key})
      : super(key: key) {
    _saved = saved;
    _types = types;
  }

  @override
  _createArticlePageState createState() =>
      _createArticlePageState(_saved, _types);
}

class _createArticlePageState extends State<createArticlePage> {
  final _formKey = GlobalKey<FormState>();
  Set<Article> _saved;
  List<ArticleType> _types;
  String name, comment;
  ArticleType type;

  _createArticlePageState(Set<Article> saved, List<ArticleType> types) {
    this._saved = saved;
    this._types = types;
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _saved.add(Article(type, name, comment, 1, ""));
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: _submit,
          icon: new Icon(Icons.save, color: Colors.white),
          label: Text("SAUVEGARDER",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white))),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('CRÉER UN NOUVEL ARTICLE',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: DropdownButton<ArticleType>(
                    items: _types.map((ArticleType t) {
                      DropdownMenuItem(
                        child: Text(t.toString()),
                        value: t,
                      );
                    }).toList(),
                    onChanged: (t) {
                      type = t;
                    },
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "Nom de l'article",
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: name,
                  onChanged: (input) => setState(() {
                    name = input;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 5.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'Commentaire',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      )),
                  initialValue: comment,
                  validator: (input) => input.trim().length <= 100
                      ? 'Entrez une commentaire valide (100 caractères max)'
                      : null,
                  onChanged: (input) => setState(() {
                    comment = input;
                  }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: Text("Type d'utilisateur :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15.0))),
            ],
          ),
        ),
      ),
    );
  }
}
