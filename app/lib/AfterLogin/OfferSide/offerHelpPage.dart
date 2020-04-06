import 'package:app/AfterLogin/Contact.dart';
import 'package:flutter/material.dart';
import '../API_requests.dart';
import '../Article.dart';
import '../Request.dart';
import '../RequestPage.dart';

class OfferHelpPage extends StatefulWidget {
  OfferHelpPage({Key key}) : super(key: key);

  final String title = 'Offrir mon aide';

  @override
  _OfferHelpPageState createState() => _OfferHelpPageState();
}

class _OfferHelpPageState extends State<OfferHelpPage> {
  List<Request> _requests;

  Future<void> initRequestList() async {
    List<Request> requests = [];

    List<Map<String, dynamic>> data =
        await APIRequests.GET_listOfRequestsNotAccepted();
    data.forEach((request) {
      Contact contact =
          Contact.fromJSON(request["contact"].cast<String, String>());
      List<Article> articles = [];

      Map<String, dynamic> order = request["order"].cast<String, dynamic>();

      Article.jsonToMap(order).forEach((type, list) {
        articles.addAll(list);
      });

      requests.add(Request(articles, contact, request["orderID"]));
    });

    setState(() {
      _requests = requests;
    });
  }

  @override
  void initState() {
    super.initState();
    initRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _requests == null || _requests.length < 1
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _requests.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RequestPage(_requests[index])));
                  },
                  child: _requests[index].widget(),
                ),
              ),
            ),
    );
  }
}
