// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_basic_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserBasicState {

 UserDetailed get userDetailed; List<Note> get latestNotes;
/// Create a copy of UserBasicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBasicStateCopyWith<UserBasicState> get copyWith => _$UserBasicStateCopyWithImpl<UserBasicState>(this as UserBasicState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBasicState&&(identical(other.userDetailed, userDetailed) || other.userDetailed == userDetailed)&&const DeepCollectionEquality().equals(other.latestNotes, latestNotes));
}


@override
int get hashCode => Object.hash(runtimeType,userDetailed,const DeepCollectionEquality().hash(latestNotes));

@override
String toString() {
  return 'UserBasicState(userDetailed: $userDetailed, latestNotes: $latestNotes)';
}


}

/// @nodoc
abstract mixin class $UserBasicStateCopyWith<$Res>  {
  factory $UserBasicStateCopyWith(UserBasicState value, $Res Function(UserBasicState) _then) = _$UserBasicStateCopyWithImpl;
@useResult
$Res call({
 UserDetailed userDetailed, List<Note> latestNotes
});




}
/// @nodoc
class _$UserBasicStateCopyWithImpl<$Res>
    implements $UserBasicStateCopyWith<$Res> {
  _$UserBasicStateCopyWithImpl(this._self, this._then);

  final UserBasicState _self;
  final $Res Function(UserBasicState) _then;

/// Create a copy of UserBasicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userDetailed = null,Object? latestNotes = null,}) {
  return _then(_self.copyWith(
userDetailed: null == userDetailed ? _self.userDetailed : userDetailed // ignore: cast_nullable_to_non_nullable
as UserDetailed,latestNotes: null == latestNotes ? _self.latestNotes : latestNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}

}


/// @nodoc


class _UserBasicState implements UserBasicState {
  const _UserBasicState({required this.userDetailed, required final  List<Note> latestNotes}): _latestNotes = latestNotes;
  

@override final  UserDetailed userDetailed;
 final  List<Note> _latestNotes;
@override List<Note> get latestNotes {
  if (_latestNotes is EqualUnmodifiableListView) return _latestNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestNotes);
}


/// Create a copy of UserBasicState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBasicStateCopyWith<_UserBasicState> get copyWith => __$UserBasicStateCopyWithImpl<_UserBasicState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBasicState&&(identical(other.userDetailed, userDetailed) || other.userDetailed == userDetailed)&&const DeepCollectionEquality().equals(other._latestNotes, _latestNotes));
}


@override
int get hashCode => Object.hash(runtimeType,userDetailed,const DeepCollectionEquality().hash(_latestNotes));

@override
String toString() {
  return 'UserBasicState(userDetailed: $userDetailed, latestNotes: $latestNotes)';
}


}

/// @nodoc
abstract mixin class _$UserBasicStateCopyWith<$Res> implements $UserBasicStateCopyWith<$Res> {
  factory _$UserBasicStateCopyWith(_UserBasicState value, $Res Function(_UserBasicState) _then) = __$UserBasicStateCopyWithImpl;
@override @useResult
$Res call({
 UserDetailed userDetailed, List<Note> latestNotes
});




}
/// @nodoc
class __$UserBasicStateCopyWithImpl<$Res>
    implements _$UserBasicStateCopyWith<$Res> {
  __$UserBasicStateCopyWithImpl(this._self, this._then);

  final _UserBasicState _self;
  final $Res Function(_UserBasicState) _then;

/// Create a copy of UserBasicState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userDetailed = null,Object? latestNotes = null,}) {
  return _then(_UserBasicState(
userDetailed: null == userDetailed ? _self.userDetailed : userDetailed // ignore: cast_nullable_to_non_nullable
as UserDetailed,latestNotes: null == latestNotes ? _self._latestNotes : latestNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}


}

// dart format on
