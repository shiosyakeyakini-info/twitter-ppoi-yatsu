// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Login {
  String get host => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  bool get isLoginDone => throw _privateConstructorUsedError;
  String? get loginErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res, Login>;
  @useResult
  $Res call(
      {String host,
      String apiKey,
      bool isLoginDone,
      String? loginErrorMessage});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res, $Val extends Login>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? apiKey = null,
    Object? isLoginDone = null,
    Object? loginErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginDone: null == isLoginDone
          ? _value.isLoginDone
          : isLoginDone // ignore: cast_nullable_to_non_nullable
              as bool,
      loginErrorMessage: freezed == loginErrorMessage
          ? _value.loginErrorMessage
          : loginErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      String apiKey,
      bool isLoginDone,
      String? loginErrorMessage});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? apiKey = null,
    Object? isLoginDone = null,
    Object? loginErrorMessage = freezed,
  }) {
    return _then(_$LoginImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      isLoginDone: null == isLoginDone
          ? _value.isLoginDone
          : isLoginDone // ignore: cast_nullable_to_non_nullable
              as bool,
      loginErrorMessage: freezed == loginErrorMessage
          ? _value.loginErrorMessage
          : loginErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl(
      {required this.host,
      required this.apiKey,
      required this.isLoginDone,
      this.loginErrorMessage});

  @override
  final String host;
  @override
  final String apiKey;
  @override
  final bool isLoginDone;
  @override
  final String? loginErrorMessage;

  @override
  String toString() {
    return 'Login(host: $host, apiKey: $apiKey, isLoginDone: $isLoginDone, loginErrorMessage: $loginErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.isLoginDone, isLoginDone) ||
                other.isLoginDone == isLoginDone) &&
            (identical(other.loginErrorMessage, loginErrorMessage) ||
                other.loginErrorMessage == loginErrorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, host, apiKey, isLoginDone, loginErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);
}

abstract class _Login implements Login {
  const factory _Login(
      {required final String host,
      required final String apiKey,
      required final bool isLoginDone,
      final String? loginErrorMessage}) = _$LoginImpl;

  @override
  String get host;
  @override
  String get apiKey;
  @override
  bool get isLoginDone;
  @override
  String? get loginErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
