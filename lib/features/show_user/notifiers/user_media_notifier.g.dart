// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_media_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserMediaNotifier)
const userMediaNotifierProvider = UserMediaNotifierFamily._();

final class UserMediaNotifierProvider
    extends $AsyncNotifierProvider<UserMediaNotifier, List<Note>> {
  const UserMediaNotifierProvider._({
    required UserMediaNotifierFamily super.from,
    required (String?, String) super.argument,
  }) : super(
         retry: null,
         name: r'userMediaNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userMediaNotifierHash();

  @override
  String toString() {
    return r'userMediaNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserMediaNotifier create() => UserMediaNotifier();

  @$internal
  @override
  _$UserMediaNotifierElement $createElement($ProviderPointer pointer) =>
      _$UserMediaNotifierElement(pointer);

  ProviderListenable<UserMediaNotifier$LoadMoreMediaNotes>
  get loadMoreMediaNotes => $LazyProxyListenable<
    UserMediaNotifier$LoadMoreMediaNotes,
    AsyncValue<List<Note>>
  >(this, (element) {
    element as _$UserMediaNotifierElement;

    return element._$loadMoreMediaNotes;
  });

  @override
  bool operator ==(Object other) {
    return other is UserMediaNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userMediaNotifierHash() => r'fed352663a2e6d0a91b5163feaa14e0f2706f894';

final class UserMediaNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserMediaNotifier,
          AsyncValue<List<Note>>,
          List<Note>,
          FutureOr<List<Note>>,
          (String?, String)
        > {
  const UserMediaNotifierFamily._()
    : super(
        retry: null,
        name: r'userMediaNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserMediaNotifierProvider call(String? host, String userName) =>
      UserMediaNotifierProvider._(argument: (host, userName), from: this);

  @override
  String toString() => r'userMediaNotifierProvider';
}

abstract class _$UserMediaNotifier extends $AsyncNotifier<List<Note>> {
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

class _$UserMediaNotifierElement
    extends $AsyncNotifierProviderElement<UserMediaNotifier, List<Note>> {
  _$UserMediaNotifierElement(super.pointer) {
    _$loadMoreMediaNotes.result = $Result.data(
      _$UserMediaNotifier$LoadMoreMediaNotes(this),
    );
  }
  final _$loadMoreMediaNotes =
      $ElementLense<_$UserMediaNotifier$LoadMoreMediaNotes>();
  @override
  void mount() {
    super.mount();
    _$loadMoreMediaNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadMoreMediaNotes);
  }
}

sealed class UserMediaNotifier$LoadMoreMediaNotes extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [UserMediaNotifier.loadMoreMediaNotes] with the provided parameters.
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

final class _$UserMediaNotifier$LoadMoreMediaNotes
    extends
        $AsyncMutationBase<
          void,
          _$UserMediaNotifier$LoadMoreMediaNotes,
          UserMediaNotifier
        >
    implements UserMediaNotifier$LoadMoreMediaNotes {
  _$UserMediaNotifier$LoadMoreMediaNotes(
    this.element, {
    super.state,
    super.key,
  });

  @override
  final _$UserMediaNotifierElement element;

  @override
  $ElementLense<_$UserMediaNotifier$LoadMoreMediaNotes> get listenable =>
      element._$loadMoreMediaNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadMoreMediaNotes, []),
      ($notifier) => $notifier.loadMoreMediaNotes(),
    );
  }

  @override
  _$UserMediaNotifier$LoadMoreMediaNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$UserMediaNotifier$LoadMoreMediaNotes(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
