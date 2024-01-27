// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPageDataNotifierHash() =>
    r'dde321fb90c7784e79898633f2d44ebf7c9af2f6';

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

abstract class _$UserPageDataNotifier
    extends BuildlessAutoDisposeAsyncNotifier<UserPageData> {
  late final String userName;
  late final String? host;

  FutureOr<UserPageData> build(
    String userName,
    String? host,
  );
}

/// See also [UserPageDataNotifier].
@ProviderFor(UserPageDataNotifier)
const userPageDataNotifierProvider = UserPageDataNotifierFamily();

/// See also [UserPageDataNotifier].
class UserPageDataNotifierFamily extends Family<AsyncValue<UserPageData>> {
  /// See also [UserPageDataNotifier].
  const UserPageDataNotifierFamily();

  /// See also [UserPageDataNotifier].
  UserPageDataNotifierProvider call(
    String userName,
    String? host,
  ) {
    return UserPageDataNotifierProvider(
      userName,
      host,
    );
  }

  @override
  UserPageDataNotifierProvider getProviderOverride(
    covariant UserPageDataNotifierProvider provider,
  ) {
    return call(
      provider.userName,
      provider.host,
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
  String? get name => r'userPageDataNotifierProvider';
}

/// See also [UserPageDataNotifier].
class UserPageDataNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserPageDataNotifier, UserPageData> {
  /// See also [UserPageDataNotifier].
  UserPageDataNotifierProvider(
    String userName,
    String? host,
  ) : this._internal(
          () => UserPageDataNotifier()
            ..userName = userName
            ..host = host,
          from: userPageDataNotifierProvider,
          name: r'userPageDataNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPageDataNotifierHash,
          dependencies: UserPageDataNotifierFamily._dependencies,
          allTransitiveDependencies:
              UserPageDataNotifierFamily._allTransitiveDependencies,
          userName: userName,
          host: host,
        );

  UserPageDataNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.host,
  }) : super.internal();

  final String userName;
  final String? host;

  @override
  FutureOr<UserPageData> runNotifierBuild(
    covariant UserPageDataNotifier notifier,
  ) {
    return notifier.build(
      userName,
      host,
    );
  }

  @override
  Override overrideWith(UserPageDataNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserPageDataNotifierProvider._internal(
        () => create()
          ..userName = userName
          ..host = host,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        host: host,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserPageDataNotifier, UserPageData>
      createElement() {
    return _UserPageDataNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPageDataNotifierProvider &&
        other.userName == userName &&
        other.host == host;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, host.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserPageDataNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<UserPageData> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `host` of this provider.
  String? get host;
}

class _UserPageDataNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserPageDataNotifier,
        UserPageData> with UserPageDataNotifierRef {
  _UserPageDataNotifierProviderElement(super.provider);

  @override
  String get userName => (origin as UserPageDataNotifierProvider).userName;
  @override
  String? get host => (origin as UserPageDataNotifierProvider).host;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
