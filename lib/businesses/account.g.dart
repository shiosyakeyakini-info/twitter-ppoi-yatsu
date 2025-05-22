// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  token: json['token'] as String,
  host: json['host'] as String,
  i: MeDetailed.fromJson(json['i'] as Map<String, dynamic>),
  meta: MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
  emoji:
      (json['emoji'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'token': instance.token,
  'host': instance.host,
  'i': instance.i,
  'meta': instance.meta,
  'emoji': instance.emoji,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AccountNotifier)
const accountNotifierProvider = AccountNotifierProvider._();

final class AccountNotifierProvider
    extends $AsyncNotifierProvider<AccountNotifier, Account?> {
  const AccountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountNotifierHash();

  @$internal
  @override
  AccountNotifier create() => AccountNotifier();

  @$internal
  @override
  $AsyncNotifierProviderElement<AccountNotifier, Account?> $createElement(
    $ProviderPointer pointer,
  ) => $AsyncNotifierProviderElement(pointer);
}

String _$accountNotifierHash() => r'ce9b3f873965b8b53328a909d504c832d38d5b25';

abstract class _$AccountNotifier extends $AsyncNotifier<Account?> {
  FutureOr<Account?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Account?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Account?>>,
              AsyncValue<Account?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
