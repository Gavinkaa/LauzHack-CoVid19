import 'package:flutter/material.dart';

import 'AskSide/Articles.dart';

class OfferHelp extends StatefulWidget {
  OfferHelp({Key key}) : super(key: key);

  final String title = 'Offer Help';

  @override
  _OfferHelpState createState() => _OfferHelpState();
}

class _OfferHelpState extends State<OfferHelp> {
  List<_HelpRequest> _requests;
  @override
  void initState() {
    super.initState();
    _requests = [
      _HelpRequest("clement", "normandie"),
      _HelpRequest("lancelot", "grenoble"),
      _HelpRequest("dougydoug", "geneve"),
      _HelpRequest("ludo", "lausanne"),
      _HelpRequest("elasfour", "caire")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
                    leading: Text(
                      _requests[index]._name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    title: Text(
                      _requests[index]._location,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                )
              ),
          ),
        ),
      ),
    );
  }
}

class _HelpRequest {
  String _name;
  String _location;

  _HelpRequest(String name, String location) {
    _name = name;
    _location = location;
  }
}

class _HelpRequestWithArticles extends _HelpRequest {
  List<Article> _articles;

  _HelpRequestWithArticles(String name, String location, List<Article> articles)
      : super(name, location) {
    _articles = articles;
  }
}
