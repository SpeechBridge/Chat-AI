// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sign _$$_SignFromJson(Map<String, dynamic> json) => _$_Sign(
      text: json['text'] as String,
      link: json['link'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SignToJson(_$_Sign instance) => <String, dynamic>{
      'text': instance.text,
      'link': instance.link,
      'categories': instance.categories,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_SignDataModel _$$_SignDataModelFromJson(Map<String, dynamic> json) =>
    _$_SignDataModel(
      category: json['category'] as String,
      signs: (json['signs'] as List<dynamic>)
          .map((e) => Sign.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SignDataModelToJson(_$_SignDataModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'signs': instance.signs,
    };
