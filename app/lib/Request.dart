import 'package:app/AskSide/Articles.dart';

import 'Contact.dart';

class Request {
  List<Article> articles;
  Contact asker;

  Request(List<Article> articles, Contact asker) {
    this.articles = List.from(articles);
    this.asker = Contact.from(asker);
  }

  List<Article> getArticles() {
    return List.from(articles);
  }

  Contact getAsker() {
    return Contact.from(asker);
  }

  void setArticles(List<Article> articles) {
    this.articles = List.from(articles);
  }

  void setAsker(Contact asker) {
    this.asker = Contact.from(asker);
  }
}
