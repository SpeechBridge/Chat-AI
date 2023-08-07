import 'package:flutter/foundation.dart';

@immutable
class SignDataModel {
  final List<SignData> signDataList;

  const SignDataModel({required this.signDataList});

  factory SignDataModel.fromJson(List<dynamic> json) {
    return SignDataModel(
      signDataList: json.map((item) => SignData.fromJson(item)).toList(),
    );
  }
}

class SignData {
  const SignData({
    required this.category,
    required this.signs,
  });

  final String category;
  final List<Sign> signs;

  factory SignData.fromJson(Map<String, dynamic> json) => SignData(
      category: json['category'].toString(),
      signs: (json['signs'] as List? ?? [])
          .map((e) => Sign.fromJson(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toJson() =>
      {'category': category, 'signs': signs.map((e) => e.toJson()).toList()};

  SignData clone() =>
      SignData(category: category, signs: signs.map((e) => e.clone()).toList());

  SignData copyWith({String? category, List<Sign>? signs}) => SignData(
        category: category ?? this.category,
        signs: signs ?? this.signs,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignData && category == other.category && signs == other.signs;

  @override
  int get hashCode => category.hashCode ^ signs.hashCode;
}

@immutable
class Sign {
  const Sign({
    required this.text,
    required this.link,
    required this.categories,
  });

  final String text;
  final String link;
  final List<Category> categories;

  factory Sign.fromJson(Map<String, dynamic> json) => Sign(
      text: json['text'].toString(),
      link: json['link'].toString(),
      categories: (json['categories'] as List? ?? [])
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toJson() => {
        'text': text,
        'link': link,
        'categories': categories.map((e) => e.toJson()).toList()
      };

  Sign clone() => Sign(
      text: text,
      link: link,
      categories: categories.map((e) => e.clone()).toList());

  Sign copyWith({String? text, String? link, List<Category>? categories}) =>
      Sign(
        text: text ?? this.text,
        link: link ?? this.link,
        categories: categories ?? this.categories,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sign &&
          text == other.text &&
          link == other.link &&
          categories == other.categories;

  @override
  int get hashCode => text.hashCode ^ link.hashCode ^ categories.hashCode;
}

@immutable
class Category {
  const Category({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'] as int, name: json['name'].toString());

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  Category clone() => Category(id: id, name: name);

  Category copyWith({int? id, String? name}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category && id == other.id && name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
