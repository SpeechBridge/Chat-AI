// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sign _$SignFromJson(Map<String, dynamic> json) {
  return _Sign.fromJson(json);
}

/// @nodoc
mixin _$Sign {
  String get text => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignCopyWith<Sign> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignCopyWith<$Res> {
  factory $SignCopyWith(Sign value, $Res Function(Sign) then) =
      _$SignCopyWithImpl<$Res, Sign>;
  @useResult
  $Res call({String text, String link, List<Category> categories});
}

/// @nodoc
class _$SignCopyWithImpl<$Res, $Val extends Sign>
    implements $SignCopyWith<$Res> {
  _$SignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? link = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignCopyWith<$Res> implements $SignCopyWith<$Res> {
  factory _$$_SignCopyWith(_$_Sign value, $Res Function(_$_Sign) then) =
      __$$_SignCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String link, List<Category> categories});
}

/// @nodoc
class __$$_SignCopyWithImpl<$Res> extends _$SignCopyWithImpl<$Res, _$_Sign>
    implements _$$_SignCopyWith<$Res> {
  __$$_SignCopyWithImpl(_$_Sign _value, $Res Function(_$_Sign) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? link = null,
    Object? categories = null,
  }) {
    return _then(_$_Sign(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sign with DiagnosticableTreeMixin implements _Sign {
  const _$_Sign(
      {required this.text,
      required this.link,
      required final List<Category> categories})
      : _categories = categories;

  factory _$_Sign.fromJson(Map<String, dynamic> json) => _$$_SignFromJson(json);

  @override
  final String text;
  @override
  final String link;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sign(text: $text, link: $link, categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sign'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sign &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, link,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignCopyWith<_$_Sign> get copyWith =>
      __$$_SignCopyWithImpl<_$_Sign>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignToJson(
      this,
    );
  }
}

abstract class _Sign implements Sign {
  const factory _Sign(
      {required final String text,
      required final String link,
      required final List<Category> categories}) = _$_Sign;

  factory _Sign.fromJson(Map<String, dynamic> json) = _$_Sign.fromJson;

  @override
  String get text;
  @override
  String get link;
  @override
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_SignCopyWith<_$_Sign> get copyWith => throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Category(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category with DiagnosticableTreeMixin implements _Category {
  const _$_Category({required this.id, required this.name});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category({required final int id, required final String name}) =
      _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

SignDataModel _$SignDataModelFromJson(Map<String, dynamic> json) {
  return _SignDataModel.fromJson(json);
}

/// @nodoc
mixin _$SignDataModel {
  String get category => throw _privateConstructorUsedError;
  List<Sign> get signs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignDataModelCopyWith<SignDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignDataModelCopyWith<$Res> {
  factory $SignDataModelCopyWith(
          SignDataModel value, $Res Function(SignDataModel) then) =
      _$SignDataModelCopyWithImpl<$Res, SignDataModel>;
  @useResult
  $Res call({String category, List<Sign> signs});
}

/// @nodoc
class _$SignDataModelCopyWithImpl<$Res, $Val extends SignDataModel>
    implements $SignDataModelCopyWith<$Res> {
  _$SignDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? signs = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      signs: null == signs
          ? _value.signs
          : signs // ignore: cast_nullable_to_non_nullable
              as List<Sign>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignDataModelCopyWith<$Res>
    implements $SignDataModelCopyWith<$Res> {
  factory _$$_SignDataModelCopyWith(
          _$_SignDataModel value, $Res Function(_$_SignDataModel) then) =
      __$$_SignDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, List<Sign> signs});
}

/// @nodoc
class __$$_SignDataModelCopyWithImpl<$Res>
    extends _$SignDataModelCopyWithImpl<$Res, _$_SignDataModel>
    implements _$$_SignDataModelCopyWith<$Res> {
  __$$_SignDataModelCopyWithImpl(
      _$_SignDataModel _value, $Res Function(_$_SignDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? signs = null,
  }) {
    return _then(_$_SignDataModel(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      signs: null == signs
          ? _value._signs
          : signs // ignore: cast_nullable_to_non_nullable
              as List<Sign>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignDataModel with DiagnosticableTreeMixin implements _SignDataModel {
  const _$_SignDataModel(
      {required this.category, required final List<Sign> signs})
      : _signs = signs;

  factory _$_SignDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignDataModelFromJson(json);

  @override
  final String category;
  final List<Sign> _signs;
  @override
  List<Sign> get signs {
    if (_signs is EqualUnmodifiableListView) return _signs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signs);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignDataModel(category: $category, signs: $signs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignDataModel'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('signs', signs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignDataModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._signs, _signs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_signs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignDataModelCopyWith<_$_SignDataModel> get copyWith =>
      __$$_SignDataModelCopyWithImpl<_$_SignDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignDataModelToJson(
      this,
    );
  }
}

abstract class _SignDataModel implements SignDataModel {
  const factory _SignDataModel(
      {required final String category,
      required final List<Sign> signs}) = _$_SignDataModel;

  factory _SignDataModel.fromJson(Map<String, dynamic> json) =
      _$_SignDataModel.fromJson;

  @override
  String get category;
  @override
  List<Sign> get signs;
  @override
  @JsonKey(ignore: true)
  _$$_SignDataModelCopyWith<_$_SignDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
