// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Timeline {
  TimelineType get type => throw _privateConstructorUsedError;
  List<Note> get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineCopyWith<Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineCopyWith<$Res> {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) then) =
      _$TimelineCopyWithImpl<$Res, Timeline>;
  @useResult
  $Res call({TimelineType type, List<Note> note});
}

/// @nodoc
class _$TimelineCopyWithImpl<$Res, $Val extends Timeline>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelineType,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimelineImplCopyWith<$Res>
    implements $TimelineCopyWith<$Res> {
  factory _$$TimelineImplCopyWith(
          _$TimelineImpl value, $Res Function(_$TimelineImpl) then) =
      __$$TimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimelineType type, List<Note> note});
}

/// @nodoc
class __$$TimelineImplCopyWithImpl<$Res>
    extends _$TimelineCopyWithImpl<$Res, _$TimelineImpl>
    implements _$$TimelineImplCopyWith<$Res> {
  __$$TimelineImplCopyWithImpl(
      _$TimelineImpl _value, $Res Function(_$TimelineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? note = null,
  }) {
    return _then(_$TimelineImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelineType,
      note: null == note
          ? _value._note
          : note // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc

class _$TimelineImpl implements _Timeline {
  const _$TimelineImpl({required this.type, required final List<Note> note})
      : _note = note;

  @override
  final TimelineType type;
  final List<Note> _note;
  @override
  List<Note> get note {
    if (_note is EqualUnmodifiableListView) return _note;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_note);
  }

  @override
  String toString() {
    return 'Timeline(type: $type, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._note, _note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_note));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineImplCopyWith<_$TimelineImpl> get copyWith =>
      __$$TimelineImplCopyWithImpl<_$TimelineImpl>(this, _$identity);
}

abstract class _Timeline implements Timeline {
  const factory _Timeline(
      {required final TimelineType type,
      required final List<Note> note}) = _$TimelineImpl;

  @override
  TimelineType get type;
  @override
  List<Note> get note;
  @override
  @JsonKey(ignore: true)
  _$$TimelineImplCopyWith<_$TimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
