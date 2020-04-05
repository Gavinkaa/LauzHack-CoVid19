import 'dart:convert';

import 'package:flutter/material.dart';

enum _Type {
  Viande,
  Legumes,
  Fruits,
  Poisson,
  Epicerie,
  ProdLait,
  Cosmetiques,
  ProdMen,
  Boissons,
  Papeterie,
  PetitDej,
  Autre
}

class ArticleType {
  _Type _type;
  String _str;

  ArticleType.fromString(String s) {
    switch (s) {
      case "Viande":
        _type = _Type.Viande;
        break;
      case "Legumes":
        _type = _Type.Legumes;
        break;
      case "Fruits":
        _type = _Type.Fruits;
        break;
      case "Poisson":
        _type = _Type.Poisson;
        break;
      case "Epicerie":
        _type = _Type.Epicerie;
        break;
      case "Produits_laitiers":
        _type = _Type.ProdLait;
        break;
      case "Cosmetiques":
        _type = _Type.Cosmetiques;
        break;
      case "Boissons":
        _type = _Type.Boissons;
        break;
      case "Papeterie":
        _type = _Type.Papeterie;
        break;
      case "Petit_dejeuner":
        _type = _Type.PetitDej;
        break;
      case "Produits_menagers":
        _type = _Type.ProdMen;
        break;
      default:
        _type = _Type.Autre;
    }
    _str = s;
  }

  ArticleType.fromType(_Type type) {
    switch (type) {
      case _Type.Viande:
        _str = "Viande";
        break;
      case _Type.Legumes:
        _str = "Legumes";
        break;
      case _Type.Fruits:
        _str = "Fruits";
        break;
      case _Type.Poisson:
        _str = "Poisson";
        break;
      case _Type.Epicerie:
        _str = "Epicerie";
        break;
      case _Type.ProdLait:
        _str = "Produits_laitiers";
        break;
      case _Type.Cosmetiques:
        _str = "Cosmetiques";
        break;
      case _Type.Boissons:
        _str = "Boissons";
        break;
      case _Type.Papeterie:
        _str = "Papeterie";
        break;
      case _Type.PetitDej:
        _str = "Petit_dejeuner";
        break;
      case _Type.ProdMen:
        _str = "Produits_menagers";
        break;
      default:
        _str = "Autre";
    }
    _type = type;
  }

  ArticleType.from(ArticleType articleType) {
    this._type = articleType._type;
    this._str = articleType._str;
  }

  _Type getType() {
    return this._type;
  }

  String getStr() {
    return this._str;
  }

  @override
  String toString() {
    switch (this._type) {
      case _Type.Viande:
        return "Viande";
        break;
      case _Type.Legumes:
        return "Légumes";
        break;
      case _Type.Fruits:
        return "Fruits";
        break;
      case _Type.Poisson:
        return "Poisson";
        break;
      case _Type.Epicerie:
        return "Epicerie";
        break;
      case _Type.ProdLait:
        return "Produits laitiers";
        break;
      case _Type.Cosmetiques:
        return "Cosmétiques";
        break;
      case _Type.Boissons:
        return "Boissons";
        break;
      case _Type.Papeterie:
        return "Papeterie";
        break;
      case _Type.PetitDej:
        return "Petit déjeuner";
        break;
      case _Type.ProdMen:
        return "Produits ménagers";
        break;
      default:
        return "Autre";
    }
  }

  @override
  int get hashCode => hashValues(_type, _str);

  @override
  bool operator ==(o) => o is ArticleType && _type == o._type && _str == o._str;
}

class Article implements Comparable {
  String _name, _comment, _iconUrl;
  ArticleType _type;
  int _quantity;

  Article(ArticleType type, String name, String comment, int quantity,
      String iconUrl) {
    this._name = name;
    this._comment = comment;
    this._quantity = quantity;
    this._type = ArticleType.from(type);
    this._iconUrl = iconUrl;
  }

  // Map<String, List<Map<String, String>>>
  static Map<ArticleType, List<Article>> jsonToMap(Map<String, dynamic> data) {
    Map<ArticleType, List<Article>> elementsByType = {};
    data.forEach((key, value) {
      List<Article> articles = [];
      for (int i = 0; i < value.length; i++) {
        articles.add(Article(
            ArticleType.fromString(key),
            value[i]["name"],
            value[i]["comment"],
            value[i]["quantity"] == "" ? 0 : int.parse(value[i]["quantity"]),
            value[i]["icon_url"]));
      }
      elementsByType.putIfAbsent(ArticleType.fromString(key), () => articles);
    });
    return elementsByType;
  }

  static String toJSON(Map<ArticleType, List<Article>> mapToConvert) {
    Map<String, List<Map<String, String>>> articles = {};
    mapToConvert.forEach((k, v) => articles.putIfAbsent(
          k.toString(),
          () => v
              .map((i) => {
                    "name": i._name,
                    "comment": i._comment,
                    "quantity": i._quantity,
                    "icon-url": i._iconUrl
                  })
              .toList(),
        ));

    return jsonEncode(articles);
  }

  String getName() {
    return this._name;
  }

  String getComment() {
    return this._comment;
  }

  int getQuantity() {
    return this._quantity;
  }

  ArticleType getArticleType() {
    return this._type;
  }

  String getIconURL() {
    return this._iconUrl;
  }

  @override
  int compareTo(other) {
    return _name.compareTo(other._name);
  }
}
