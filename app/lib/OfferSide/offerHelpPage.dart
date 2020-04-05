import 'package:app/AskSide/Articles.dart';
import 'package:flutter/material.dart';
import '../Request.dart';

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
                          _requests[index].getAsker().getFirstName(),
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                            _requests[index].getNumberOfArticles() == 1
                                ? "1 article"
                                : _requests[index]
                                        .getNumberOfArticles()
                                        .toString() +
                                    " articles",
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w200))
                      ],
                    ),
                    title: Text(
                      _requests[index].getAsker().getCity(),
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
