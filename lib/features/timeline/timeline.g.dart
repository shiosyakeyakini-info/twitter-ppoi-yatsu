// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TimelineNotifier)
const timelineNotifierProvider = TimelineNotifierFamily._();

final class TimelineNotifierProvider
    extends $AsyncNotifierProvider<TimelineNotifier, Timeline> {
  const TimelineNotifierProvider._({
    required TimelineNotifierFamily super.from,
    required TimelineType super.argument,
  }) : super(
         retry: null,
         name: r'timelineNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$timelineNotifierHash();

  @override
  String toString() {
    return r'timelineNotifierProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TimelineNotifier create() => TimelineNotifier();

  @$internal
  @override
  _$TimelineNotifierElement $createElement($ProviderPointer pointer) =>
      _$TimelineNotifierElement(pointer);

  ProviderListenable<TimelineNotifier$UpdateFromTop> get updateFromTop =>
      $LazyProxyListenable<
        TimelineNotifier$UpdateFromTop,
        AsyncValue<Timeline>
      >(this, (element) {
        element as _$TimelineNotifierElement;

        return element._$updateFromTop;
      });

  ProviderListenable<TimelineNotifier$UpdateFromBottom> get updateFromBottom =>
      $LazyProxyListenable<
        TimelineNotifier$UpdateFromBottom,
        AsyncValue<Timeline>
      >(this, (element) {
        element as _$TimelineNotifierElement;

        return element._$updateFromBottom;
      });

  @override
  bool operator ==(Object other) {
    return other is TimelineNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timelineNotifierHash() => r'd98e14afbcfe6c17555f0223735e17fc6f7c31dc';

final class TimelineNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TimelineNotifier,
          AsyncValue<Timeline>,
          Timeline,
          FutureOr<Timeline>,
          TimelineType
        > {
  const TimelineNotifierFamily._()
    : super(
        retry: null,
        name: r'timelineNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TimelineNotifierProvider call(TimelineType type) =>
      TimelineNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'timelineNotifierProvider';
}

abstract class _$TimelineNotifier extends $AsyncNotifier<Timeline> {
  late final _$args = ref.$arg as TimelineType;
  TimelineType get type => _$args;

  FutureOr<Timeline> build(TimelineType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Timeline>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Timeline>>,
              AsyncValue<Timeline>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$TimelineNotifierElement
    extends $AsyncNotifierProviderElement<TimelineNotifier, Timeline> {
  _$TimelineNotifierElement(super.pointer) {
    _$updateFromTop.result = $Result.data(
      _$TimelineNotifier$UpdateFromTop(this),
    );
    _$updateFromBottom.result = $Result.data(
      _$TimelineNotifier$UpdateFromBottom(this),
    );
  }
  final _$updateFromTop = $ElementLense<_$TimelineNotifier$UpdateFromTop>();
  final _$updateFromBottom =
      $ElementLense<_$TimelineNotifier$UpdateFromBottom>();
  @override
  void mount() {
    super.mount();
    _$updateFromTop.result!.value!.reset();
    _$updateFromBottom.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$updateFromTop);
    listenableVisitor(_$updateFromBottom);
  }
}

sealed class TimelineNotifier$UpdateFromTop extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [TimelineNotifier.updateFromTop] with the provided parameters.
  ///
  /// After the method completes, the mutation state will be updated to either
  /// [SuccessMutation] or [ErrorMutation] based on if the method
  /// threw or not.
  ///
  /// **Note**:
  /// If the notifier threw in its constructor, the mutation won't start
  /// and [call] will throw.
  /// This should generally never happen though, as Notifiers are not supposed
  /// to have logic in their constructors.
  Future<void> call();
}

final class _$TimelineNotifier$UpdateFromTop
    extends
        $AsyncMutationBase<
          void,
          _$TimelineNotifier$UpdateFromTop,
          TimelineNotifier
        >
    implements TimelineNotifier$UpdateFromTop {
  _$TimelineNotifier$UpdateFromTop(this.element, {super.state, super.key});

  @override
  final _$TimelineNotifierElement element;

  @override
  $ElementLense<_$TimelineNotifier$UpdateFromTop> get listenable =>
      element._$updateFromTop;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#updateFromTop, []),
      ($notifier) => $notifier.updateFromTop(),
    );
  }

  @override
  _$TimelineNotifier$UpdateFromTop copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$TimelineNotifier$UpdateFromTop(element, state: state, key: key);
}

sealed class TimelineNotifier$UpdateFromBottom extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [TimelineNotifier.updateFromBottom] with the provided parameters.
  ///
  /// After the method completes, the mutation state will be updated to either
  /// [SuccessMutation] or [ErrorMutation] based on if the method
  /// threw or not.
  ///
  /// **Note**:
  /// If the notifier threw in its constructor, the mutation won't start
  /// and [call] will throw.
  /// This should generally never happen though, as Notifiers are not supposed
  /// to have logic in their constructors.
  Future<void> call();
}

final class _$TimelineNotifier$UpdateFromBottom
    extends
        $AsyncMutationBase<
          void,
          _$TimelineNotifier$UpdateFromBottom,
          TimelineNotifier
        >
    implements TimelineNotifier$UpdateFromBottom {
  _$TimelineNotifier$UpdateFromBottom(this.element, {super.state, super.key});

  @override
  final _$TimelineNotifierElement element;

  @override
  $ElementLense<_$TimelineNotifier$UpdateFromBottom> get listenable =>
      element._$updateFromBottom;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#updateFromBottom, []),
      ($notifier) => $notifier.updateFromBottom(),
    );
  }

  @override
  _$TimelineNotifier$UpdateFromBottom copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$TimelineNotifier$UpdateFromBottom(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
