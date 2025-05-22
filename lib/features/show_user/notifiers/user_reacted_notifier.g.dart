// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reacted_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserReactedNotifier)
const userReactedNotifierProvider = UserReactedNotifierFamily._();

final class UserReactedNotifierProvider
    extends $AsyncNotifierProvider<UserReactedNotifier, List<Note>> {
  const UserReactedNotifierProvider._({
    required UserReactedNotifierFamily super.from,
    required (String?, String) super.argument,
  }) : super(
         retry: null,
         name: r'userReactedNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userReactedNotifierHash();

  @override
  String toString() {
    return r'userReactedNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserReactedNotifier create() => UserReactedNotifier();

  @$internal
  @override
  _$UserReactedNotifierElement $createElement($ProviderPointer pointer) =>
      _$UserReactedNotifierElement(pointer);

  ProviderListenable<UserReactedNotifier$LoadReactedNotes>
  get loadReactedNotes => $LazyProxyListenable<
    UserReactedNotifier$LoadReactedNotes,
    AsyncValue<List<Note>>
  >(this, (element) {
    element as _$UserReactedNotifierElement;

    return element._$loadReactedNotes;
  });

  @override
  bool operator ==(Object other) {
    return other is UserReactedNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userReactedNotifierHash() =>
    r'1cd908598d21d467a0ea839286445b4cbf0d6c69';

final class UserReactedNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserReactedNotifier,
          AsyncValue<List<Note>>,
          List<Note>,
          FutureOr<List<Note>>,
          (String?, String)
        > {
  const UserReactedNotifierFamily._()
    : super(
        retry: null,
        name: r'userReactedNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserReactedNotifierProvider call(String? host, String userName) =>
      UserReactedNotifierProvider._(argument: (host, userName), from: this);

  @override
  String toString() => r'userReactedNotifierProvider';
}

abstract class _$UserReactedNotifier extends $AsyncNotifier<List<Note>> {
  late final _$args = ref.$arg as (String?, String);
  String? get host => _$args.$1;
  String get userName => _$args.$2;

  FutureOr<List<Note>> build(String? host, String userName);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<List<Note>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Note>>>,
              AsyncValue<List<Note>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$UserReactedNotifierElement
    extends $AsyncNotifierProviderElement<UserReactedNotifier, List<Note>> {
  _$UserReactedNotifierElement(super.pointer) {
    _$loadReactedNotes.result = $Result.data(
      _$UserReactedNotifier$LoadReactedNotes(this),
    );
  }
  final _$loadReactedNotes =
      $ElementLense<_$UserReactedNotifier$LoadReactedNotes>();
  @override
  void mount() {
    super.mount();
    _$loadReactedNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadReactedNotes);
  }
}

sealed class UserReactedNotifier$LoadReactedNotes extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [UserReactedNotifier.loadReactedNotes] with the provided parameters.
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

final class _$UserReactedNotifier$LoadReactedNotes
    extends
        $AsyncMutationBase<
          void,
          _$UserReactedNotifier$LoadReactedNotes,
          UserReactedNotifier
        >
    implements UserReactedNotifier$LoadReactedNotes {
  _$UserReactedNotifier$LoadReactedNotes(
    this.element, {
    super.state,
    super.key,
  });

  @override
  final _$UserReactedNotifierElement element;

  @override
  $ElementLense<_$UserReactedNotifier$LoadReactedNotes> get listenable =>
      element._$loadReactedNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadReactedNotes, []),
      ($notifier) => $notifier.loadReactedNotes(),
    );
  }

  @override
  _$UserReactedNotifier$LoadReactedNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$UserReactedNotifier$LoadReactedNotes(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
