// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timelineNotifierHash() => r'0e20d7d68cd825e9f39c35d5fd1d0fbd505db0b0';

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

abstract class _$TimelineNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Timeline> {
  late final TimelineType type;

  FutureOr<Timeline> build(
    TimelineType type,
  );
}

/// See also [TimelineNotifier].
@ProviderFor(TimelineNotifier)
const timelineNotifierProvider = TimelineNotifierFamily();

/// See also [TimelineNotifier].
class TimelineNotifierFamily extends Family<AsyncValue<Timeline>> {
  /// See also [TimelineNotifier].
  const TimelineNotifierFamily();

  /// See also [TimelineNotifier].
  TimelineNotifierProvider call(
    TimelineType type,
  ) {
    return TimelineNotifierProvider(
      type,
    );
  }

  @override
  TimelineNotifierProvider getProviderOverride(
    covariant TimelineNotifierProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'timelineNotifierProvider';
}

/// See also [TimelineNotifier].
class TimelineNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TimelineNotifier, Timeline> {
  /// See also [TimelineNotifier].
  TimelineNotifierProvider(
    TimelineType type,
  ) : this._internal(
          () => TimelineNotifier()..type = type,
          from: timelineNotifierProvider,
          name: r'timelineNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$timelineNotifierHash,
          dependencies: TimelineNotifierFamily._dependencies,
          allTransitiveDependencies:
              TimelineNotifierFamily._allTransitiveDependencies,
          type: type,
        );

  TimelineNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final TimelineType type;

  @override
  FutureOr<Timeline> runNotifierBuild(
    covariant TimelineNotifier notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(TimelineNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TimelineNotifierProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TimelineNotifier, Timeline>
      createElement() {
    return _TimelineNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimelineNotifierProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TimelineNotifierRef on AutoDisposeAsyncNotifierProviderRef<Timeline> {
  /// The parameter `type` of this provider.
  TimelineType get type;
}

class _TimelineNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TimelineNotifier, Timeline>
    with TimelineNotifierRef {
  _TimelineNotifierProviderElement(super.provider);

  @override
  TimelineType get type => (origin as TimelineNotifierProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
