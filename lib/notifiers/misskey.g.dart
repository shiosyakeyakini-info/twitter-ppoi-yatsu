// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misskey.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$misskeyHash() => r'9cf02af737198f5925182b78eec4c7d11589570f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [misskey].
@ProviderFor(misskey)
const misskeyProvider = MisskeyFamily();

/// See also [misskey].
class MisskeyFamily extends Family<Misskey> {
  /// See also [misskey].
  const MisskeyFamily();

  /// See also [misskey].
  MisskeyProvider call({
    required String? token,
    required String host,
  }) {
    return MisskeyProvider(
      token: token,
      host: host,
    );
  }

  @override
  MisskeyProvider getProviderOverride(
    covariant MisskeyProvider provider,
  ) {
    return call(
      token: provider.token,
      host: provider.host,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'misskeyProvider';
}

/// See also [misskey].
class MisskeyProvider extends AutoDisposeProvider<Misskey> {
  /// See also [misskey].
  MisskeyProvider({
    required String? token,
    required String host,
  }) : this._internal(
          (ref) => misskey(
            ref as MisskeyRef,
            token: token,
            host: host,
          ),
          from: misskeyProvider,
          name: r'misskeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$misskeyHash,
          dependencies: MisskeyFamily._dependencies,
          allTransitiveDependencies: MisskeyFamily._allTransitiveDependencies,
          token: token,
          host: host,
        );

  MisskeyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
    required this.host,
  }) : super.internal();

  final String? token;
  final String host;

  @override
  Override overrideWith(
    Misskey Function(MisskeyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MisskeyProvider._internal(
        (ref) => create(ref as MisskeyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
        host: host,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Misskey> createElement() {
    return _MisskeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MisskeyProvider &&
        other.token == token &&
        other.host == host;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, host.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MisskeyRef on AutoDisposeProviderRef<Misskey> {
  /// The parameter `token` of this provider.
  String? get token;

  /// The parameter `host` of this provider.
  String get host;
}

class _MisskeyProviderElement extends AutoDisposeProviderElement<Misskey>
    with MisskeyRef {
  _MisskeyProviderElement(super.provider);

  @override
  String? get token => (origin as MisskeyProvider).token;
  @override
  String get host => (origin as MisskeyProvider).host;
}

String _$currentMisskeyHash() => r'3b405a6ccacb98a6445965f3959e289ca3063444';

/// See also [currentMisskey].
@ProviderFor(currentMisskey)
final currentMisskeyProvider = AutoDisposeProvider<Misskey>.internal(
  currentMisskey,
  name: r'currentMisskeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMisskeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentMisskeyRef = AutoDisposeProviderRef<Misskey>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
