// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get token => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  IResponse get i => throw _privateConstructorUsedError;
  MetaResponse get meta => throw _privateConstructorUsedError;
  List<Emoji> get emoji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String token,
      String host,
      IResponse i,
      MetaResponse meta,
      List<Emoji> emoji});

  $IResponseCopyWith<$Res> get i;
  $MetaResponseCopyWith<$Res> get meta;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? host = null,
    Object? i = null,
    Object? meta = null,
    Object? emoji = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as IResponse,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaResponse,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as List<Emoji>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IResponseCopyWith<$Res> get i {
    return $IResponseCopyWith<$Res>(_value.i, (value) {
      return _then(_value.copyWith(i: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaResponseCopyWith<$Res> get meta {
    return $MetaResponseCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String host,
      IResponse i,
      MetaResponse meta,
      List<Emoji> emoji});

  @override
  $IResponseCopyWith<$Res> get i;
  @override
  $MetaResponseCopyWith<$Res> get meta;
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? host = null,
    Object? i = null,
    Object? meta = null,
    Object? emoji = null,
  }) {
    return _then(_$AccountImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as IResponse,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaResponse,
      emoji: null == emoji
          ? _value._emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as List<Emoji>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {required this.token,
      required this.host,
      required this.i,
      required this.meta,
      required final List<Emoji> emoji})
      : _emoji = emoji;

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String token;
  @override
  final String host;
  @override
  final IResponse i;
  @override
  final MetaResponse meta;
  final List<Emoji> _emoji;
  @override
  List<Emoji> get emoji {
    if (_emoji is EqualUnmodifiableListView) return _emoji;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emoji);
  }

  @override
  String toString() {
    return 'Account(token: $token, host: $host, i: $i, meta: $meta, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._emoji, _emoji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, host, i, meta,
      const DeepCollectionEquality().hash(_emoji));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final String token,
      required final String host,
      required final IResponse i,
      required final MetaResponse meta,
      required final List<Emoji> emoji}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get token;
  @override
  String get host;
  @override
  IResponse get i;
  @override
  MetaResponse get meta;
  @override
  List<Emoji> get emoji;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
