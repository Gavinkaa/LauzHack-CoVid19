import 'package:flutter/material.dart';

class OfferHelp extends StatefulWidget {
  OfferHelp({Key key}) : super(key: key);

  final String title = 'Offer Help';

  @override
  _OfferHelpState createState() => _OfferHelpState();
}

class _OfferHelpState extends State<OfferHelp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      ),
    );
  }
}
