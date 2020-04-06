import 'package:app/AfterLogin/OfferSide/offerHelpPage.dart';
import 'package:app/BeforeLogin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'AskSide/askHelpPage.dart';

class AfterLoginHomePage extends StatefulWidget {
  static final String id = "after_login_screen";
  AfterLoginHomePage({Key key}) : super(key: key);

  final String title = 'HelpYourNeighbor';

  @override
  _AfterLoginHomePageState createState() => _AfterLoginHomePageState();
}

class _AfterLoginHomePageState extends State<AfterLoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 24.0),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "DECONNEXION",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                    content: Text(
                        "Êtes-vous sûr(e) de vouloir vous déconnecter ?",
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("ANNULER",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.red))),
                      FlatButton(
                          onPressed: () => AuthServ.logout(context),
                          child: Text("DECONNEXION",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.red))),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.red,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Colors.white70,
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AskHelpPage()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("DEMANDER DE L'AIDE",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w200,
                          color: Colors.red)),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: RaisedButton(
                color: Colors.white70,
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OfferHelpPage()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("OFFRIR MON AIDE",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w200,
                          color: Colors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
