class Article implements Comparable {
  String _name, _comment;

  Article(String name, String comment) {
    this._name = name;
    this._comment = comment;
  }

  static List<Article> dataToList(List<dynamic> data) {
    List<Article> l = [];
    for (int i = 0; i < data.length; i++) {
      l.add(Article(data[i]["name"], data[i]["comment"]));
    }
    return l;
  }

  static List<Article> dataToSortedList(List<dynamic> data) {
    List<Article> l = dataToList(data);
    l.sort();
    return l;
  }

  String getName() {
    return this._name;
  }

  String getComment() {
    return this._comment;
  }

  @override
  int compareTo(other) {
    return _name.compareTo(other._name);
  }
}
