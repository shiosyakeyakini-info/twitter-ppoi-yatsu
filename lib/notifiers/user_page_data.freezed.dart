// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPageData {
  UsersShowResponse get userDetailed => throw _privateConstructorUsedError;
  List<Note> get latestNotes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPageDataCopyWith<UserPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPageDataCopyWith<$Res> {
  factory $UserPageDataCopyWith(
          UserPageData value, $Res Function(UserPageData) then) =
      _$UserPageDataCopyWithImpl<$Res, UserPageData>;
  @useResult
  $Res call({UsersShowResponse userDetailed, List<Note> latestNotes});

  $UsersShowResponseCopyWith<$Res> get userDetailed;
}

/// @nodoc
class _$UserPageDataCopyWithImpl<$Res, $Val extends UserPageData>
    implements $UserPageDataCopyWith<$Res> {
  _$UserPageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetailed = null,
    Object? latestNotes = null,
  }) {
    return _then(_value.copyWith(
      userDetailed: null == userDetailed
          ? _value.userDetailed
          : userDetailed // ignore: cast_nullable_to_non_nullable
              as UsersShowResponse,
      latestNotes: null == latestNotes
          ? _value.latestNotes
          : latestNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersShowResponseCopyWith<$Res> get userDetailed {
    return $UsersShowResponseCopyWith<$Res>(_value.userDetailed, (value) {
      return _then(_value.copyWith(userDetailed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPageDataImplCopyWith<$Res>
    implements $UserPageDataCopyWith<$Res> {
  factory _$$UserPageDataImplCopyWith(
          _$UserPageDataImpl value, $Res Function(_$UserPageDataImpl) then) =
      __$$UserPageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UsersShowResponse userDetailed, List<Note> latestNotes});

  @override
  $UsersShowResponseCopyWith<$Res> get userDetailed;
}

/// @nodoc
class __$$UserPageDataImplCopyWithImpl<$Res>
    extends _$UserPageDataCopyWithImpl<$Res, _$UserPageDataImpl>
    implements _$$UserPageDataImplCopyWith<$Res> {
  __$$UserPageDataImplCopyWithImpl(
      _$UserPageDataImpl _value, $Res Function(_$UserPageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetailed = null,
    Object? latestNotes = null,
  }) {
    return _then(_$UserPageDataImpl(
      userDetailed: null == userDetailed
          ? _value.userDetailed
          : userDetailed // ignore: cast_nullable_to_non_nullable
              as UsersShowResponse,
      latestNotes: null == latestNotes
          ? _value._latestNotes
          : latestNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc

class _$UserPageDataImpl implements _UserPageData {
  const _$UserPageDataImpl(
      {required this.userDetailed, required final List<Note> latestNotes})
      : _latestNotes = latestNotes;

  @override
  final UsersShowResponse userDetailed;
  final List<Note> _latestNotes;
  @override
  List<Note> get latestNotes {
    if (_latestNotes is EqualUnmodifiableListView) return _latestNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestNotes);
  }

  @override
  String toString() {
    return 'UserPageData(userDetailed: $userDetailed, latestNotes: $latestNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPageDataImpl &&
            (identical(other.userDetailed, userDetailed) ||
                other.userDetailed == userDetailed) &&
            const DeepCollectionEquality()
                .equals(other._latestNotes, _latestNotes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userDetailed,
      const DeepCollectionEquality().hash(_latestNotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPageDataImplCopyWith<_$UserPageDataImpl> get copyWith =>
      __$$UserPageDataImplCopyWithImpl<_$UserPageDataImpl>(this, _$identity);
}

abstract class _UserPageData implements UserPageData {
  const factory _UserPageData(
      {required final UsersShowResponse userDetailed,
      required final List<Note> latestNotes}) = _$UserPageDataImpl;

  @override
  UsersShowResponse get userDetailed;
  @override
  List<Note> get latestNotes;
  @override
  @JsonKey(ignore: true)
  _$$UserPageDataImplCopyWith<_$UserPageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
