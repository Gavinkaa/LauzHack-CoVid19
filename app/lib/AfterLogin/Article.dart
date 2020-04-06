import 'dart:convert';

import 'package:flutter/material.dart';

enum ArticleTypeEnum {
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
  ArticleTypeEnum _type;
  String _str;

  ArticleType.fromString(String s) {
    switch (s) {
      case "Viande":
        _type = ArticleTypeEnum.Viande;
        break;
      case "Legumes":
        _type = ArticleTypeEnum.Legumes;
        break;
      case "Fruits":
        _type = ArticleTypeEnum.Fruits;
        break;
      case "Poisson":
        _type = ArticleTypeEnum.Poisson;
        break;
      case "Epicerie":
        _type = ArticleTypeEnum.Epicerie;
        break;
      case "Produits_laitiers":
        _type = ArticleTypeEnum.ProdLait;
        break;
      case "Cosmetiques":
        _type = ArticleTypeEnum.Cosmetiques;
        break;
      case "Boissons":
        _type = ArticleTypeEnum.Boissons;
        break;
      case "Papeterie":
        _type = ArticleTypeEnum.Papeterie;
        break;
      case "Petit_dejeuner":
        _type = ArticleTypeEnum.PetitDej;
        break;
      case "Produits_menagers":
        _type = ArticleTypeEnum.ProdMen;
        break;
      default:
        _type = ArticleTypeEnum.Autre;
    }
    _str = s;
  }

  ArticleType.fromType(ArticleTypeEnum type) {
    switch (type) {
      case ArticleTypeEnum.Viande:
        _str = "Viande";
        break;
      case ArticleTypeEnum.Legumes:
        _str = "Legumes";
        break;
      case ArticleTypeEnum.Fruits:
        _str = "Fruits";
        break;
      case ArticleTypeEnum.Poisson:
        _str = "Poisson";
        break;
      case ArticleTypeEnum.Epicerie:
        _str = "Epicerie";
        break;
      case ArticleTypeEnum.ProdLait:
        _str = "Produits_laitiers";
        break;
      case ArticleTypeEnum.Cosmetiques:
        _str = "Cosmetiques";
        break;
      case ArticleTypeEnum.Boissons:
        _str = "Boissons";
        break;
      case ArticleTypeEnum.Papeterie:
        _str = "Papeterie";
        break;
      case ArticleTypeEnum.PetitDej:
        _str = "Petit_dejeuner";
        break;
      case ArticleTypeEnum.ProdMen:
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

  ArticleTypeEnum getType() {
    return this._type;
  }

  String getStr() {
    return this._str;
  }

  static String getStringFromType(ArticleTypeEnum type) {
    switch (type) {
      case ArticleTypeEnum.Viande:
        return "Viande";
        break;
      case ArticleTypeEnum.Legumes:
        return "Legumes";
        break;
      case ArticleTypeEnum.Fruits:
        return "Fruits";
        break;
      case ArticleTypeEnum.Poisson:
        return "Poisson";
        break;
      case ArticleTypeEnum.Epicerie:
        return "Epicerie";
        break;
      case ArticleTypeEnum.ProdLait:
        return "Produits_laitiers";
        break;
      case ArticleTypeEnum.Cosmetiques:
        return "Cosmetiques";
        break;
      case ArticleTypeEnum.Boissons:
        return "Boissons";
        break;
      case ArticleTypeEnum.Papeterie:
        return "Papeterie";
        break;
      case ArticleTypeEnum.PetitDej:
        return "Petit_dejeuner";
        break;
      case ArticleTypeEnum.ProdMen:
        return "Produits_menagers";
        break;
      default:
        return "Autre";
    }
  }

  @override
  String toString() {
    switch (this._type) {
      case ArticleTypeEnum.Viande:
        return "Viande";
        break;
      case ArticleTypeEnum.Legumes:
        return "Légumes";
        break;
      case ArticleTypeEnum.Fruits:
        return "Fruits";
        break;
      case ArticleTypeEnum.Poisson:
        return "Poisson";
        break;
      case ArticleTypeEnum.Epicerie:
        return "Epicerie";
        break;
      case ArticleTypeEnum.ProdLait:
        return "Produits laitiers";
        break;
      case ArticleTypeEnum.Cosmetiques:
        return "Cosmétiques";
        break;
      case ArticleTypeEnum.Boissons:
        return "Boissons";
        break;
      case ArticleTypeEnum.Papeterie:
        return "Papeterie";
        break;
      case ArticleTypeEnum.PetitDej:
        return "Petit déjeuner";
        break;
      case ArticleTypeEnum.ProdMen:
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
    data.cast<String, List<dynamic>>().forEach((key, v) {
      List<Map> value = List<Map>.from(v);

      List<Article> articles = [];
      for (int i = 0; i < value.length; i++) {
        articles.add(Article(
            ArticleType.fromString(key),
            value[i].cast<String, String>()["name"],
            value[i].cast<String, String>()["comment"],
            value[i].cast<String, int>()["quantity"],
            value[i].cast<String, String>()["icon_url"]));
      }
      elementsByType.putIfAbsent(ArticleType.fromString(key), () => articles);
    });
    return elementsByType;
  }

  static Map<String, dynamic> toJSON(
      Map<ArticleType, List<Article>> mapToConvert) {
    Map<String, dynamic> articles = {};
    mapToConvert.forEach((k, v) => articles.putIfAbsent(
          k.getStr(),
          () => v
              .map((i) => {
                    "name": i._name,
                    "comment": i._comment,
                    "quantity": i._quantity,
                    "icon-url": i._iconUrl
                  })
              .toList(),
        ));

    return articles;
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

  bool setQuantity(int quantity) {
    if (quantity < 0) {
      return false;
    } else {
      this._quantity = quantity;
      return true;
    }
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
