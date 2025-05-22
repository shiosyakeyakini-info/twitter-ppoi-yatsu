// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_basic_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserBasicNotifier)
const userBasicNotifierProvider = UserBasicNotifierFamily._();

final class UserBasicNotifierProvider
    extends $AsyncNotifierProvider<UserBasicNotifier, UserBasicState> {
  const UserBasicNotifierProvider._({
    required UserBasicNotifierFamily super.from,
    required (String?, String) super.argument,
  }) : super(
         retry: null,
         name: r'userBasicNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userBasicNotifierHash();

  @override
  String toString() {
    return r'userBasicNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserBasicNotifier create() => UserBasicNotifier();

  @$internal
  @override
  _$UserBasicNotifierElement $createElement($ProviderPointer pointer) =>
      _$UserBasicNotifierElement(pointer);

  ProviderListenable<UserBasicNotifier$LoadMoreNotes> get loadMoreNotes =>
      $LazyProxyListenable<
        UserBasicNotifier$LoadMoreNotes,
        AsyncValue<UserBasicState>
      >(this, (element) {
        element as _$UserBasicNotifierElement;

        return element._$loadMoreNotes;
      });

  @override
  bool operator ==(Object other) {
    return other is UserBasicNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userBasicNotifierHash() => r'64f15b0a45447f0d10728bd20bf3e4737e72e9d6';

final class UserBasicNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserBasicNotifier,
          AsyncValue<UserBasicState>,
          UserBasicState,
          FutureOr<UserBasicState>,
          (String?, String)
        > {
  const UserBasicNotifierFamily._()
    : super(
        retry: null,
        name: r'userBasicNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserBasicNotifierProvider call(String? host, String userName) =>
      UserBasicNotifierProvider._(argument: (host, userName), from: this);

  @override
  String toString() => r'userBasicNotifierProvider';
}

abstract class _$UserBasicNotifier extends $AsyncNotifier<UserBasicState> {
  late final _$args = ref.$arg as (String?, String);
  String? get host => _$args.$1;
  String get userName => _$args.$2;

  FutureOr<UserBasicState> build(String? host, String userName);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<UserBasicState>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserBasicState>>,
              AsyncValue<UserBasicState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$UserBasicNotifierElement
    extends $AsyncNotifierProviderElement<UserBasicNotifier, UserBasicState> {
  _$UserBasicNotifierElement(super.pointer) {
    _$loadMoreNotes.result = $Result.data(
      _$UserBasicNotifier$LoadMoreNotes(this),
    );
  }
  final _$loadMoreNotes = $ElementLense<_$UserBasicNotifier$LoadMoreNotes>();
  @override
  void mount() {
    super.mount();
    _$loadMoreNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadMoreNotes);
  }
}

sealed class UserBasicNotifier$LoadMoreNotes extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [UserBasicNotifier.loadMoreNotes] with the provided parameters.
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

final class _$UserBasicNotifier$LoadMoreNotes
    extends
        $AsyncMutationBase<
          void,
          _$UserBasicNotifier$LoadMoreNotes,
          UserBasicNotifier
        >
    implements UserBasicNotifier$LoadMoreNotes {
  _$UserBasicNotifier$LoadMoreNotes(this.element, {super.state, super.key});

  @override
  final _$UserBasicNotifierElement element;

  @override
  $ElementLense<_$UserBasicNotifier$LoadMoreNotes> get listenable =>
      element._$loadMoreNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadMoreNotes, []),
      ($notifier) => $notifier.loadMoreNotes(),
    );
  }

  @override
  _$UserBasicNotifier$LoadMoreNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$UserBasicNotifier$LoadMoreNotes(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
