// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misskey.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(misskey)
const misskeyProvider = MisskeyFamily._();

final class MisskeyProvider extends $FunctionalProvider<Misskey, Misskey>
    with $Provider<Misskey> {
  const MisskeyProvider._({
    required MisskeyFamily super.from,
    required ({String? token, String host}) super.argument,
  }) : super(
         retry: null,
         name: r'misskeyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$misskeyHash();

  @override
  String toString() {
    return r'misskeyProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Misskey> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Misskey create(Ref ref) {
    final argument = this.argument as ({String? token, String host});
    return misskey(ref, token: argument.token, host: argument.host);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Misskey value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Misskey>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MisskeyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$misskeyHash() => r'3595086227bd870f5e9f02743dc1009c8013a5b5';

final class MisskeyFamily extends $Family
    with $FunctionalFamilyOverride<Misskey, ({String? token, String host})> {
  const MisskeyFamily._()
    : super(
        retry: null,
        name: r'misskeyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MisskeyProvider call({required String? token, required String host}) =>
      MisskeyProvider._(argument: (token: token, host: host), from: this);

  @override
  String toString() => r'misskeyProvider';
}

@ProviderFor(currentMisskey)
const currentMisskeyProvider = CurrentMisskeyProvider._();

final class CurrentMisskeyProvider extends $FunctionalProvider<Misskey, Misskey>
    with $Provider<Misskey> {
  const CurrentMisskeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMisskeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMisskeyHash();

  @$internal
  @override
  $ProviderElement<Misskey> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Misskey create(Ref ref) {
    return currentMisskey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Misskey value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Misskey>(value),
    );
  }
}

String _$currentMisskeyHash() => r'ee46cf425b58d6143b56ff7bc435481cba7e92ce';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
