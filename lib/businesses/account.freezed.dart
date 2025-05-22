// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {

 String get token; String get host; MeDetailed get i; MetaResponse get meta; List<Emoji> get emoji;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.token, token) || other.token == token)&&(identical(other.host, host) || other.host == host)&&(identical(other.i, i) || other.i == i)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.emoji, emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,host,i,meta,const DeepCollectionEquality().hash(emoji));

@override
String toString() {
  return 'Account(token: $token, host: $host, i: $i, meta: $meta, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String token, String host, MeDetailed i, MetaResponse meta, List<Emoji> emoji
});


$MeDetailedCopyWith<$Res> get i;$MetaResponseCopyWith<$Res> get meta;

}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? host = null,Object? i = null,Object? meta = null,Object? emoji = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,i: null == i ? _self.i : i // ignore: cast_nullable_to_non_nullable
as MeDetailed,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as List<Emoji>,
  ));
}
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeDetailedCopyWith<$Res> get i {
  
  return $MeDetailedCopyWith<$Res>(_self.i, (value) {
    return _then(_self.copyWith(i: value));
  });
}/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaResponseCopyWith<$Res> get meta {
  
  return $MetaResponseCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({required this.token, required this.host, required this.i, required this.meta, required final  List<Emoji> emoji}): _emoji = emoji;
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override final  String token;
@override final  String host;
@override final  MeDetailed i;
@override final  MetaResponse meta;
 final  List<Emoji> _emoji;
@override List<Emoji> get emoji {
  if (_emoji is EqualUnmodifiableListView) return _emoji;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emoji);
}


/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.token, token) || other.token == token)&&(identical(other.host, host) || other.host == host)&&(identical(other.i, i) || other.i == i)&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._emoji, _emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,host,i,meta,const DeepCollectionEquality().hash(_emoji));

@override
String toString() {
  return 'Account(token: $token, host: $host, i: $i, meta: $meta, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String token, String host, MeDetailed i, MetaResponse meta, List<Emoji> emoji
});


@override $MeDetailedCopyWith<$Res> get i;@override $MetaResponseCopyWith<$Res> get meta;

}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? host = null,Object? i = null,Object? meta = null,Object? emoji = null,}) {
  return _then(_Account(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,i: null == i ? _self.i : i // ignore: cast_nullable_to_non_nullable
as MeDetailed,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse,emoji: null == emoji ? _self._emoji : emoji // ignore: cast_nullable_to_non_nullable
as List<Emoji>,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeDetailedCopyWith<$Res> get i {
  
  return $MeDetailedCopyWith<$Res>(_self.i, (value) {
    return _then(_self.copyWith(i: value));
  });
}/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaResponseCopyWith<$Res> get meta {
  
  return $MetaResponseCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
