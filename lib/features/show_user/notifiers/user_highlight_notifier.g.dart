// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_highlight_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserHighlightNotifier)
const userHighlightNotifierProvider = UserHighlightNotifierFamily._();

final class UserHighlightNotifierProvider
    extends $AsyncNotifierProvider<UserHighlightNotifier, List<Note>> {
  const UserHighlightNotifierProvider._({
    required UserHighlightNotifierFamily super.from,
    required (String?, String) super.argument,
  }) : super(
         retry: null,
         name: r'userHighlightNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userHighlightNotifierHash();

  @override
  String toString() {
    return r'userHighlightNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserHighlightNotifier create() => UserHighlightNotifier();

  @$internal
  @override
  _$UserHighlightNotifierElement $createElement($ProviderPointer pointer) =>
      _$UserHighlightNotifierElement(pointer);

  ProviderListenable<UserHighlightNotifier$LoadMoreHighlightNotes>
  get loadMoreHighlightNotes => $LazyProxyListenable<
    UserHighlightNotifier$LoadMoreHighlightNotes,
    AsyncValue<List<Note>>
  >(this, (element) {
    element as _$UserHighlightNotifierElement;

    return element._$loadMoreHighlightNotes;
  });

  @override
  bool operator ==(Object other) {
    return other is UserHighlightNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userHighlightNotifierHash() =>
    r'1bc721c839cdf62fd9583ce924af6b3e632cdd6d';

final class UserHighlightNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserHighlightNotifier,
          AsyncValue<List<Note>>,
          List<Note>,
          FutureOr<List<Note>>,
          (String?, String)
        > {
  const UserHighlightNotifierFamily._()
    : super(
        retry: null,
        name: r'userHighlightNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserHighlightNotifierProvider call(String? host, String userName) =>
      UserHighlightNotifierProvider._(argument: (host, userName), from: this);

  @override
  String toString() => r'userHighlightNotifierProvider';
}

abstract class _$UserHighlightNotifier extends $AsyncNotifier<List<Note>> {
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

class _$UserHighlightNotifierElement
    extends $AsyncNotifierProviderElement<UserHighlightNotifier, List<Note>> {
  _$UserHighlightNotifierElement(super.pointer) {
    _$loadMoreHighlightNotes.result = $Result.data(
      _$UserHighlightNotifier$LoadMoreHighlightNotes(this),
    );
  }
  final _$loadMoreHighlightNotes =
      $ElementLense<_$UserHighlightNotifier$LoadMoreHighlightNotes>();
  @override
  void mount() {
    super.mount();
    _$loadMoreHighlightNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadMoreHighlightNotes);
  }
}

sealed class UserHighlightNotifier$LoadMoreHighlightNotes
    extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [UserHighlightNotifier.loadMoreHighlightNotes] with the provided parameters.
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

final class _$UserHighlightNotifier$LoadMoreHighlightNotes
    extends
        $AsyncMutationBase<
          void,
          _$UserHighlightNotifier$LoadMoreHighlightNotes,
          UserHighlightNotifier
        >
    implements UserHighlightNotifier$LoadMoreHighlightNotes {
  _$UserHighlightNotifier$LoadMoreHighlightNotes(
    this.element, {
    super.state,
    super.key,
  });

  @override
  final _$UserHighlightNotifierElement element;

  @override
  $ElementLense<_$UserHighlightNotifier$LoadMoreHighlightNotes>
  get listenable => element._$loadMoreHighlightNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadMoreHighlightNotes, []),
      ($notifier) => $notifier.loadMoreHighlightNotes(),
    );
  }

  @override
  _$UserHighlightNotifier$LoadMoreHighlightNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$UserHighlightNotifier$LoadMoreHighlightNotes(
    element,
    state: state,
    key: key,
  );
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
