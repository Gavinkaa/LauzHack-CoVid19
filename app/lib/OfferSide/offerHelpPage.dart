import 'package:app/AskSide/Articles.dart';
import 'package:flutter/material.dart';

class OfferHelpPage extends StatefulWidget {
  OfferHelpPage({Key key}) : super(key: key);

  final String title = 'Offer Help';

  @override
  _OfferHelpPageState createState() => _OfferHelpPageState();
}

class _OfferHelpPageState extends State<OfferHelpPage> {
  List<_HelpRequest> _requests;
  @override
  void initState() {
    super.initState();
    _requests = [
      // API calls to database
      //_HelpRequest(user name, location, List<Article> articles)
      // _HelpRequest("Clément", "Saint-Sulpice", 1),
      // _HelpRequest("Lancelot", "Saint-Sulpice", 20),
      // _HelpRequest("Douglas", "Morges", 30),
      // _HelpRequest("Ludovic", "Lausanne", 10),
      // _HelpRequest("Mohamed", "Le Caire", 5),
      // _HelpRequest("Clément", "Saint-Sulpice", 1),
      // _HelpRequest("Lancelot", "Saint-Sulpice", 20),
      // _HelpRequest("Douglas", "Morges", 30),
      // _HelpRequest("Ludovic", "Lausanne", 10),
      // _HelpRequest("Mohamed", "Le Caire", 5),
      // _HelpRequest("Clément", "Saint-Sulpice", 1),
      // _HelpRequest("Lancelot", "Saint-Sulpice", 20),
      // _HelpRequest("Douglas", "Morges", 30),
      // _HelpRequest("Ludovic", "Lausanne", 10),
      // _HelpRequest("Mohamed", "Le Caire", 5),
      // _HelpRequest("Clément", "Saint-Sulpice", 1),
      // _HelpRequest("Lancelot", "Saint-Sulpice", 20),
      // _HelpRequest("Douglas", "Morges", 30),
      // _HelpRequest("Ludovic", "Lausanne", 10),
      // _HelpRequest("Mohamed", "Le Caire", 5)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _requests.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {},
            child: Card(
                elevation: 9.0,
                color: Colors.transparent,
                margin:
                    new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.0),
                    leading: Column(
                      children: <Widget>[
                        Text(
                          _requests[index]._name,
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                            _requests[index]._nb_of_articles == 1
                                ? "1 article"
                                : _requests[index]._nb_of_articles.toString() +
                                    " articles",
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w200))
                      ],
                    ),
                    title: Text(
                      _requests[index]._location,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class _HelpRequest {
  String _name, _location;
  int _nb_of_articles;
  List<Article> _articles;

  _HelpRequest(String name, String location, List<Article> articles) {
    _name = name;
    _location = location;
    this._articles = articles;
    this._nb_of_articles = _articles.length;
  }
}

// class _HelpRequestWithArticles extends _HelpRequest {
//   List<Article> _articles;

//   _HelpRequestWithArticles(String name, String location, List<Article> articles)
//       : super(name, location, articles.length) {
//     _articles = articles;
//   }
// }
