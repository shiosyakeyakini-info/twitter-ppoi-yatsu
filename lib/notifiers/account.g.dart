// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      token: json['token'] as String,
      host: json['host'] as String,
      i: MeDetailed.fromJson(json['i'] as Map<String, dynamic>),
      meta: MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      emoji: (json['emoji'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'host': instance.host,
      'i': instance.i,
      'meta': instance.meta,
      'emoji': instance.emoji,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountNotifierHash() => r'1b52f437e05d176e79103e642e91aaa3ac8e54d0';

/// See also [AccountNotifier].
@ProviderFor(AccountNotifier)
final accountNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AccountNotifier, Account?>.internal(
  AccountNotifier.new,
  name: r'accountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AccountNotifier = AutoDisposeAsyncNotifier<Account?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
