import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_data_model.freezed.dart';
part 'sign_data_model.g.dart';

@freezed
abstract class Sign with _$Sign {
  const factory Sign({
    required String text,
    required String link,
    required List<Category> categories,
  }) = _Sign;

  factory Sign.fromJson(Map<String, dynamic> json) => _$SignFromJson(json);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
abstract class SignDataModel with _$SignDataModel {
  const factory SignDataModel({
    required String category,
    required List<Sign> signs,
  }) = _SignDataModel;

  factory SignDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignDataModelFromJson(json);
}
