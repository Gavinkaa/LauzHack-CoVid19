import 'package:app/AfterLogin/OfferSide/offerHelpPage.dart';
import 'package:app/BeforeLogin/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'AskSide/askHelpPage.dart';

class AfterLoginHomePage extends StatefulWidget {
  static final String id = "after_login_screen";
  AfterLoginHomePage({Key key}) : super(key: key);

  final String title = 'HelpYourNeighbors';

  @override
  _AfterLoginHomePageState createState() => _AfterLoginHomePageState();
}

class _AfterLoginHomePageState extends State<AfterLoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => AuthServ.logout(context),
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.red,
                size: 32.0,
              )),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AskHelpPage()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Demander de l'aide",
                      style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OfferHelpPage()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Offrir son aide",
                      style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
