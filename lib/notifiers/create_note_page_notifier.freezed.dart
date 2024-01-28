// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_note_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateNotePageData {
  String get tweet => throw _privateConstructorUsedError;
  bool get isNoteCreating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNotePageDataCopyWith<CreateNotePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNotePageDataCopyWith<$Res> {
  factory $CreateNotePageDataCopyWith(
          CreateNotePageData value, $Res Function(CreateNotePageData) then) =
      _$CreateNotePageDataCopyWithImpl<$Res, CreateNotePageData>;
  @useResult
  $Res call({String tweet, bool isNoteCreating});
}

/// @nodoc
class _$CreateNotePageDataCopyWithImpl<$Res, $Val extends CreateNotePageData>
    implements $CreateNotePageDataCopyWith<$Res> {
  _$CreateNotePageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweet = null,
    Object? isNoteCreating = null,
  }) {
    return _then(_value.copyWith(
      tweet: null == tweet
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as String,
      isNoteCreating: null == isNoteCreating
          ? _value.isNoteCreating
          : isNoteCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNotePageDataImplCopyWith<$Res>
    implements $CreateNotePageDataCopyWith<$Res> {
  factory _$$CreateNotePageDataImplCopyWith(_$CreateNotePageDataImpl value,
          $Res Function(_$CreateNotePageDataImpl) then) =
      __$$CreateNotePageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tweet, bool isNoteCreating});
}

/// @nodoc
class __$$CreateNotePageDataImplCopyWithImpl<$Res>
    extends _$CreateNotePageDataCopyWithImpl<$Res, _$CreateNotePageDataImpl>
    implements _$$CreateNotePageDataImplCopyWith<$Res> {
  __$$CreateNotePageDataImplCopyWithImpl(_$CreateNotePageDataImpl _value,
      $Res Function(_$CreateNotePageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweet = null,
    Object? isNoteCreating = null,
  }) {
    return _then(_$CreateNotePageDataImpl(
      tweet: null == tweet
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as String,
      isNoteCreating: null == isNoteCreating
          ? _value.isNoteCreating
          : isNoteCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateNotePageDataImpl implements _CreateNotePageData {
  const _$CreateNotePageDataImpl(
      {required this.tweet, required this.isNoteCreating});

  @override
  final String tweet;
  @override
  final bool isNoteCreating;

  @override
  String toString() {
    return 'CreateNotePageData(tweet: $tweet, isNoteCreating: $isNoteCreating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotePageDataImpl &&
            (identical(other.tweet, tweet) || other.tweet == tweet) &&
            (identical(other.isNoteCreating, isNoteCreating) ||
                other.isNoteCreating == isNoteCreating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweet, isNoteCreating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotePageDataImplCopyWith<_$CreateNotePageDataImpl> get copyWith =>
      __$$CreateNotePageDataImplCopyWithImpl<_$CreateNotePageDataImpl>(
          this, _$identity);
}

abstract class _CreateNotePageData implements CreateNotePageData {
  const factory _CreateNotePageData(
      {required final String tweet,
      required final bool isNoteCreating}) = _$CreateNotePageDataImpl;

  @override
  String get tweet;
  @override
  bool get isNoteCreating;
  @override
  @JsonKey(ignore: true)
  _$$CreateNotePageDataImplCopyWith<_$CreateNotePageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
