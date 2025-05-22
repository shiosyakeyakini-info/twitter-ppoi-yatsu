// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reply_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserReplyNotifier)
const userReplyNotifierProvider = UserReplyNotifierFamily._();

final class UserReplyNotifierProvider
    extends $AsyncNotifierProvider<UserReplyNotifier, List<Note>> {
  const UserReplyNotifierProvider._({
    required UserReplyNotifierFamily super.from,
    required (String?, String) super.argument,
  }) : super(
         retry: null,
         name: r'userReplyNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userReplyNotifierHash();

  @override
  String toString() {
    return r'userReplyNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserReplyNotifier create() => UserReplyNotifier();

  @$internal
  @override
  _$UserReplyNotifierElement $createElement($ProviderPointer pointer) =>
      _$UserReplyNotifierElement(pointer);

  ProviderListenable<UserReplyNotifier$LoadMoreReplyNotes>
  get loadMoreReplyNotes => $LazyProxyListenable<
    UserReplyNotifier$LoadMoreReplyNotes,
    AsyncValue<List<Note>>
  >(this, (element) {
    element as _$UserReplyNotifierElement;

    return element._$loadMoreReplyNotes;
  });

  @override
  bool operator ==(Object other) {
    return other is UserReplyNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userReplyNotifierHash() => r'711674587237318fc920b9aba1a59f6e52bd0331';

final class UserReplyNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserReplyNotifier,
          AsyncValue<List<Note>>,
          List<Note>,
          FutureOr<List<Note>>,
          (String?, String)
        > {
  const UserReplyNotifierFamily._()
    : super(
        retry: null,
        name: r'userReplyNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserReplyNotifierProvider call(String? host, String userName) =>
      UserReplyNotifierProvider._(argument: (host, userName), from: this);

  @override
  String toString() => r'userReplyNotifierProvider';
}

abstract class _$UserReplyNotifier extends $AsyncNotifier<List<Note>> {
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

class _$UserReplyNotifierElement
    extends $AsyncNotifierProviderElement<UserReplyNotifier, List<Note>> {
  _$UserReplyNotifierElement(super.pointer) {
    _$loadMoreReplyNotes.result = $Result.data(
      _$UserReplyNotifier$LoadMoreReplyNotes(this),
    );
  }
  final _$loadMoreReplyNotes =
      $ElementLense<_$UserReplyNotifier$LoadMoreReplyNotes>();
  @override
  void mount() {
    super.mount();
    _$loadMoreReplyNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadMoreReplyNotes);
  }
}

sealed class UserReplyNotifier$LoadMoreReplyNotes extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [UserReplyNotifier.loadMoreReplyNotes] with the provided parameters.
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

final class _$UserReplyNotifier$LoadMoreReplyNotes
    extends
        $AsyncMutationBase<
          void,
          _$UserReplyNotifier$LoadMoreReplyNotes,
          UserReplyNotifier
        >
    implements UserReplyNotifier$LoadMoreReplyNotes {
  _$UserReplyNotifier$LoadMoreReplyNotes(
    this.element, {
    super.state,
    super.key,
  });

  @override
  final _$UserReplyNotifierElement element;

  @override
  $ElementLense<_$UserReplyNotifier$LoadMoreReplyNotes> get listenable =>
      element._$loadMoreReplyNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadMoreReplyNotes, []),
      ($notifier) => $notifier.loadMoreReplyNotes(),
    );
  }

  @override
  _$UserReplyNotifier$LoadMoreReplyNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$UserReplyNotifier$LoadMoreReplyNotes(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
