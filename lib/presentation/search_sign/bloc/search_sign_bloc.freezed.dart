// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_sign_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchSignEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? word) search,
    required TResult Function() refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? word)? search,
    TResult? Function()? refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? word)? search,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Refreshed value) refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Refreshed value)? refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Refreshed value)? refreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSignEventCopyWith<$Res> {
  factory $SearchSignEventCopyWith(
          SearchSignEvent value, $Res Function(SearchSignEvent) then) =
      _$SearchSignEventCopyWithImpl<$Res, SearchSignEvent>;
}

/// @nodoc
class _$SearchSignEventCopyWithImpl<$Res, $Val extends SearchSignEvent>
    implements $SearchSignEventCopyWith<$Res> {
  _$SearchSignEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String? word});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$SearchSignEventCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
  }) {
    return _then(_$_Search(
      freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Search with DiagnosticableTreeMixin implements _Search {
  const _$_Search(this.word);

  @override
  final String? word;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchSignEvent.search(word: $word)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchSignEvent.search'))
      ..add(DiagnosticsProperty('word', word));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.word, word) || other.word == word));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? word) search,
    required TResult Function() refreshed,
  }) {
    return search(word);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? word)? search,
    TResult? Function()? refreshed,
  }) {
    return search?.call(word);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? word)? search,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(word);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Refreshed value) refreshed,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Refreshed value)? refreshed,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Refreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchSignEvent {
  const factory _Search(final String? word) = _$_Search;

  String? get word;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshedCopyWith<$Res> {
  factory _$$_RefreshedCopyWith(
          _$_Refreshed value, $Res Function(_$_Refreshed) then) =
      __$$_RefreshedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshedCopyWithImpl<$Res>
    extends _$SearchSignEventCopyWithImpl<$Res, _$_Refreshed>
    implements _$$_RefreshedCopyWith<$Res> {
  __$$_RefreshedCopyWithImpl(
      _$_Refreshed _value, $Res Function(_$_Refreshed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Refreshed with DiagnosticableTreeMixin implements _Refreshed {
  const _$_Refreshed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchSignEvent.refreshed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SearchSignEvent.refreshed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Refreshed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? word) search,
    required TResult Function() refreshed,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? word)? search,
    TResult? Function()? refreshed,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? word)? search,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_Refreshed value) refreshed,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_Refreshed value)? refreshed,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_Refreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class _Refreshed implements SearchSignEvent {
  const factory _Refreshed() = _$_Refreshed;
}

/// @nodoc
mixin _$SearchSignState {
  SearchSignStatus get status => throw _privateConstructorUsedError;
  String? get word => throw _privateConstructorUsedError;
  SignDataModel? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchSignStateCopyWith<SearchSignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSignStateCopyWith<$Res> {
  factory $SearchSignStateCopyWith(
          SearchSignState value, $Res Function(SearchSignState) then) =
      _$SearchSignStateCopyWithImpl<$Res, SearchSignState>;
  @useResult
  $Res call({SearchSignStatus status, String? word, SignDataModel? data});
}

/// @nodoc
class _$SearchSignStateCopyWithImpl<$Res, $Val extends SearchSignState>
    implements $SearchSignStateCopyWith<$Res> {
  _$SearchSignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? word = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchSignStatus,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignDataModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchSignStateCopyWith<$Res>
    implements $SearchSignStateCopyWith<$Res> {
  factory _$$_SearchSignStateCopyWith(
          _$_SearchSignState value, $Res Function(_$_SearchSignState) then) =
      __$$_SearchSignStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchSignStatus status, String? word, SignDataModel? data});
}

/// @nodoc
class __$$_SearchSignStateCopyWithImpl<$Res>
    extends _$SearchSignStateCopyWithImpl<$Res, _$_SearchSignState>
    implements _$$_SearchSignStateCopyWith<$Res> {
  __$$_SearchSignStateCopyWithImpl(
      _$_SearchSignState _value, $Res Function(_$_SearchSignState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? word = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_SearchSignState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchSignStatus,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignDataModel?,
    ));
  }
}

/// @nodoc

class _$_SearchSignState
    with DiagnosticableTreeMixin
    implements _SearchSignState {
  const _$_SearchSignState(
      {this.status = SearchSignStatus.initial, this.word, this.data});

  @override
  @JsonKey()
  final SearchSignStatus status;
  @override
  final String? word;
  @override
  final SignDataModel? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchSignState(status: $status, word: $word, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchSignState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('word', word))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchSignState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, word, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchSignStateCopyWith<_$_SearchSignState> get copyWith =>
      __$$_SearchSignStateCopyWithImpl<_$_SearchSignState>(this, _$identity);
}

abstract class _SearchSignState implements SearchSignState {
  const factory _SearchSignState(
      {final SearchSignStatus status,
      final String? word,
      final SignDataModel? data}) = _$_SearchSignState;

  @override
  SearchSignStatus get status;
  @override
  String? get word;
  @override
  SignDataModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$_SearchSignStateCopyWith<_$_SearchSignState> get copyWith =>
      throw _privateConstructorUsedError;
}
