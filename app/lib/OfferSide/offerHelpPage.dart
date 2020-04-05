import 'package:app/AskSide/Articles.dart';
import 'package:app/Contact.dart';
import 'package:flutter/material.dart';
import '../Request.dart';
import '../RequestPage.dart';

class OfferHelpPage extends StatefulWidget {
  OfferHelpPage({Key key}) : super(key: key);

  final String title = 'Offer Help';

  @override
  _OfferHelpPageState createState() => _OfferHelpPageState();
}

class _OfferHelpPageState extends State<OfferHelpPage> {
  List<Request> _requests;
  @override
  void initState() {
    super.initState();
    _requests = [
      // API calls to database
      Request(
          [
            Article(
                ArticleType.fromString("Viande"), "beauf", "douglas", 2, ""),
            Article(ArticleType.fromString("Viande"), "bacon", "luke", 3, "")
          ],
          Contact(1055, "Froideville", "Rue du village", "c2", "lancelot",
              "scheid", "+41 77564", "blabla@gmail.com")),
      Request(
          [
            Article(
                ArticleType.fromString("Viande"), "beauf", "douglas", 2, ""),
            Article(ArticleType.fromString("Viande"), "bacon", "luke", 3, "")
          ],
          Contact(1055, "Froideville", "Rue du village", "c2", "francois",
              "scheid", "+41 77564", "blabla@gmail.com"))
    ];
    // Request(user name, location, List<Article> articles)
    // Request("Clément", "Saint-Sulpice", 1),
    // Request("Lancelot", "Saint-Sulpice", 20),
    // Request("Douglas", "Morges", 30),
    // Request("Ludovic", "Lausanne", 10),
    // Request("Mohamed", "Le Caire", 5),
    // Request("Clément", "Saint-Sulpice", 1),
    // Request("Lancelot", "Saint-Sulpice", 20),
    // Request("Douglas", "Morges", 30),
    // Request("Ludovic", "Lausanne", 10),
    // Request("Mohamed", "Le Caire", 5),
    // Request("Clément", "Saint-Sulpice", 1),
    // Request("Lancelot", "Saint-Sulpice", 20),
    // Request("Douglas", "Morges", 30),
    // Request("Ludovic", "Lausanne", 10),
    // Request("Mohamed", "Le Caire", 5),
    // Request("Clément", "Saint-Sulpice", 1),
    // Request("Lancelot", "Saint-Sulpice", 20),
    // Request("Douglas", "Morges", 30),
    // Request("Ludovic", "Lausanne", 10),
    // Request("Mohamed", "Le Caire", 5)
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RequestPage(_requests[index])));
            },
            child: _requests[index].widget(),
          ),
        ),
      ),
    );
  }
}
