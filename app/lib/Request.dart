import 'package:app/AskSide/Articles.dart';
import 'Contact.dart';

class Request {
  List<Article> _articles;
  int _nbOfArticles;
  Contact asker;

  Request(List<Article> articles, Contact asker) {
    this._articles = List.from(articles);
    this.asker = Contact.from(asker);
    this._nbOfArticles = _articles.length;
  }

  List<Article> getArticles() {
    return List.from(_articles);
  }

  int getNumberOfArticles() {
    return _nbOfArticles;
  }

  Contact getAsker() {
    return Contact.from(asker);
  }

  void setArticles(List<Article> articles) {
    this._articles = List.from(_articles);
    this._nbOfArticles = _articles.length;
  }

  void setAsker(Contact asker) {
    this.asker = Contact.from(asker);
  }
}
