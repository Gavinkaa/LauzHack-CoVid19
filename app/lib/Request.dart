import 'package:app/AskSide/Articles.dart';

import 'Contact.dart';

class Request {
  List<Article> articles;
  Contact asker;

  Request(List<Article> articles, Contact asker) {
    this.articles = List.from(articles);
    this.asker = Contact.from(asker);
  }
}
