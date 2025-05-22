// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_note_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeaturedNotesState {

 List<Note> get notes; bool get isLatestNoteReachedLast;
/// Create a copy of FeaturedNotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturedNotesStateCopyWith<FeaturedNotesState> get copyWith => _$FeaturedNotesStateCopyWithImpl<FeaturedNotesState>(this as FeaturedNotesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedNotesState&&const DeepCollectionEquality().equals(other.notes, notes)&&(identical(other.isLatestNoteReachedLast, isLatestNoteReachedLast) || other.isLatestNoteReachedLast == isLatestNoteReachedLast));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notes),isLatestNoteReachedLast);

@override
String toString() {
  return 'FeaturedNotesState(notes: $notes, isLatestNoteReachedLast: $isLatestNoteReachedLast)';
}


}

/// @nodoc
abstract mixin class $FeaturedNotesStateCopyWith<$Res>  {
  factory $FeaturedNotesStateCopyWith(FeaturedNotesState value, $Res Function(FeaturedNotesState) _then) = _$FeaturedNotesStateCopyWithImpl;
@useResult
$Res call({
 List<Note> notes, bool isLatestNoteReachedLast
});




}
/// @nodoc
class _$FeaturedNotesStateCopyWithImpl<$Res>
    implements $FeaturedNotesStateCopyWith<$Res> {
  _$FeaturedNotesStateCopyWithImpl(this._self, this._then);

  final FeaturedNotesState _self;
  final $Res Function(FeaturedNotesState) _then;

/// Create a copy of FeaturedNotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notes = null,Object? isLatestNoteReachedLast = null,}) {
  return _then(_self.copyWith(
notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,isLatestNoteReachedLast: null == isLatestNoteReachedLast ? _self.isLatestNoteReachedLast : isLatestNoteReachedLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _FeaturedNotesState implements FeaturedNotesState {
  const _FeaturedNotesState({final  List<Note> notes = const [], this.isLatestNoteReachedLast = false}): _notes = notes;
  

 final  List<Note> _notes;
@override@JsonKey() List<Note> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

@override@JsonKey() final  bool isLatestNoteReachedLast;

/// Create a copy of FeaturedNotesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturedNotesStateCopyWith<_FeaturedNotesState> get copyWith => __$FeaturedNotesStateCopyWithImpl<_FeaturedNotesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedNotesState&&const DeepCollectionEquality().equals(other._notes, _notes)&&(identical(other.isLatestNoteReachedLast, isLatestNoteReachedLast) || other.isLatestNoteReachedLast == isLatestNoteReachedLast));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes),isLatestNoteReachedLast);

@override
String toString() {
  return 'FeaturedNotesState(notes: $notes, isLatestNoteReachedLast: $isLatestNoteReachedLast)';
}


}

/// @nodoc
abstract mixin class _$FeaturedNotesStateCopyWith<$Res> implements $FeaturedNotesStateCopyWith<$Res> {
  factory _$FeaturedNotesStateCopyWith(_FeaturedNotesState value, $Res Function(_FeaturedNotesState) _then) = __$FeaturedNotesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Note> notes, bool isLatestNoteReachedLast
});




}
/// @nodoc
class __$FeaturedNotesStateCopyWithImpl<$Res>
    implements _$FeaturedNotesStateCopyWith<$Res> {
  __$FeaturedNotesStateCopyWithImpl(this._self, this._then);

  final _FeaturedNotesState _self;
  final $Res Function(_FeaturedNotesState) _then;

/// Create a copy of FeaturedNotesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notes = null,Object? isLatestNoteReachedLast = null,}) {
  return _then(_FeaturedNotesState(
notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,isLatestNoteReachedLast: null == isLatestNoteReachedLast ? _self.isLatestNoteReachedLast : isLatestNoteReachedLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SearchUsersState {

 List<UserDetailed> get users; dynamic get isUsersReachedLast;
/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersStateCopyWith<SearchUsersState> get copyWith => _$SearchUsersStateCopyWithImpl<SearchUsersState>(this as SearchUsersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersState&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.isUsersReachedLast, isUsersReachedLast));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(isUsersReachedLast));

@override
String toString() {
  return 'SearchUsersState(users: $users, isUsersReachedLast: $isUsersReachedLast)';
}


}

/// @nodoc
abstract mixin class $SearchUsersStateCopyWith<$Res>  {
  factory $SearchUsersStateCopyWith(SearchUsersState value, $Res Function(SearchUsersState) _then) = _$SearchUsersStateCopyWithImpl;
@useResult
$Res call({
 List<UserDetailed> users, dynamic isUsersReachedLast
});




}
/// @nodoc
class _$SearchUsersStateCopyWithImpl<$Res>
    implements $SearchUsersStateCopyWith<$Res> {
  _$SearchUsersStateCopyWithImpl(this._self, this._then);

  final SearchUsersState _self;
  final $Res Function(SearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? isUsersReachedLast = freezed,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserDetailed>,isUsersReachedLast: freezed == isUsersReachedLast ? _self.isUsersReachedLast : isUsersReachedLast // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc


class _SearchUsersState implements SearchUsersState {
  const _SearchUsersState({final  List<UserDetailed> users = const [], this.isUsersReachedLast = false}): _users = users;
  

 final  List<UserDetailed> _users;
@override@JsonKey() List<UserDetailed> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  dynamic isUsersReachedLast;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUsersStateCopyWith<_SearchUsersState> get copyWith => __$SearchUsersStateCopyWithImpl<_SearchUsersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUsersState&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other.isUsersReachedLast, isUsersReachedLast));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(isUsersReachedLast));

@override
String toString() {
  return 'SearchUsersState(users: $users, isUsersReachedLast: $isUsersReachedLast)';
}


}

/// @nodoc
abstract mixin class _$SearchUsersStateCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory _$SearchUsersStateCopyWith(_SearchUsersState value, $Res Function(_SearchUsersState) _then) = __$SearchUsersStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserDetailed> users, dynamic isUsersReachedLast
});




}
/// @nodoc
class __$SearchUsersStateCopyWithImpl<$Res>
    implements _$SearchUsersStateCopyWith<$Res> {
  __$SearchUsersStateCopyWithImpl(this._self, this._then);

  final _SearchUsersState _self;
  final $Res Function(_SearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? isUsersReachedLast = freezed,}) {
  return _then(_SearchUsersState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserDetailed>,isUsersReachedLast: freezed == isUsersReachedLast ? _self.isUsersReachedLast : isUsersReachedLast // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
