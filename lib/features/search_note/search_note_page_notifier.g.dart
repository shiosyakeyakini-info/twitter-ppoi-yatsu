// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_note_page_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(pinnedUser)
const pinnedUserProvider = PinnedUserProvider._();

final class PinnedUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserDetailed>>,
          FutureOr<List<UserDetailed>>
        >
    with
        $FutureModifier<List<UserDetailed>>,
        $FutureProvider<List<UserDetailed>> {
  const PinnedUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinnedUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinnedUserHash();

  @$internal
  @override
  $FutureProviderElement<List<UserDetailed>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserDetailed>> create(Ref ref) {
    return pinnedUser(ref);
  }
}

String _$pinnedUserHash() => r'8ac5f4b22cb987bdbe389d5b14bd4087cf44b4b2';

@ProviderFor(SearchQuery)
const searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  const SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  @$internal
  @override
  $NotifierProviderElement<SearchQuery, String> $createElement(
    $ProviderPointer pointer,
  ) => $NotifierProviderElement(pointer);

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'0a7656292befb5f93eea2b48792f425edc95d9f2';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FeaturedNotes)
const featuredNotesProvider = FeaturedNotesProvider._();

final class FeaturedNotesProvider
    extends $AsyncNotifierProvider<FeaturedNotes, FeaturedNotesState> {
  const FeaturedNotesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredNotesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredNotesHash();

  @$internal
  @override
  FeaturedNotes create() => FeaturedNotes();

  @$internal
  @override
  _$FeaturedNotesElement $createElement($ProviderPointer pointer) =>
      _$FeaturedNotesElement(pointer);

  ProviderListenable<FeaturedNotes$LoadFeaturedNotes> get loadFeaturedNotes =>
      $LazyProxyListenable<
        FeaturedNotes$LoadFeaturedNotes,
        AsyncValue<FeaturedNotesState>
      >(this, (element) {
        element as _$FeaturedNotesElement;

        return element._$loadFeaturedNotes;
      });
}

String _$featuredNotesHash() => r'bd1af8feb39e6367a6635c99dde84e9b0efb115d';

abstract class _$FeaturedNotes extends $AsyncNotifier<FeaturedNotesState> {
  FutureOr<FeaturedNotesState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<FeaturedNotesState>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FeaturedNotesState>>,
              AsyncValue<FeaturedNotesState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$FeaturedNotesElement
    extends $AsyncNotifierProviderElement<FeaturedNotes, FeaturedNotesState> {
  _$FeaturedNotesElement(super.pointer) {
    _$loadFeaturedNotes.result = $Result.data(
      _$FeaturedNotes$LoadFeaturedNotes(this),
    );
  }
  final _$loadFeaturedNotes =
      $ElementLense<_$FeaturedNotes$LoadFeaturedNotes>();
  @override
  void mount() {
    super.mount();
    _$loadFeaturedNotes.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadFeaturedNotes);
  }
}

sealed class FeaturedNotes$LoadFeaturedNotes extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [FeaturedNotes.loadFeaturedNotes] with the provided parameters.
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

final class _$FeaturedNotes$LoadFeaturedNotes
    extends
        $AsyncMutationBase<
          void,
          _$FeaturedNotes$LoadFeaturedNotes,
          FeaturedNotes
        >
    implements FeaturedNotes$LoadFeaturedNotes {
  _$FeaturedNotes$LoadFeaturedNotes(this.element, {super.state, super.key});

  @override
  final _$FeaturedNotesElement element;

  @override
  $ElementLense<_$FeaturedNotes$LoadFeaturedNotes> get listenable =>
      element._$loadFeaturedNotes;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadFeaturedNotes, []),
      ($notifier) => $notifier.loadFeaturedNotes(),
    );
  }

  @override
  _$FeaturedNotes$LoadFeaturedNotes copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$FeaturedNotes$LoadFeaturedNotes(element, state: state, key: key);
}

@ProviderFor(SearchUsers)
const searchUsersProvider = SearchUsersProvider._();

final class SearchUsersProvider
    extends $NotifierProvider<SearchUsers, SearchUsersState> {
  const SearchUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchUsersHash();

  @$internal
  @override
  SearchUsers create() => SearchUsers();

  @$internal
  @override
  _$SearchUsersElement $createElement($ProviderPointer pointer) =>
      _$SearchUsersElement(pointer);

  ProviderListenable<SearchUsers$LoadUsers> get loadUsers =>
      $LazyProxyListenable<SearchUsers$LoadUsers, SearchUsersState>(this, (
        element,
      ) {
        element as _$SearchUsersElement;

        return element._$loadUsers;
      });

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchUsersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<SearchUsersState>(value),
    );
  }
}

String _$searchUsersHash() => r'd7ae9ce9375e04871cd822de389bd5e7b5a63001';

abstract class _$SearchUsers extends $Notifier<SearchUsersState> {
  SearchUsersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SearchUsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchUsersState>,
              SearchUsersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$SearchUsersElement
    extends $NotifierProviderElement<SearchUsers, SearchUsersState> {
  _$SearchUsersElement(super.pointer) {
    _$loadUsers.result = $Result.data(_$SearchUsers$LoadUsers(this));
  }
  final _$loadUsers = $ElementLense<_$SearchUsers$LoadUsers>();
  @override
  void mount() {
    super.mount();
    _$loadUsers.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$loadUsers);
  }
}

sealed class SearchUsers$LoadUsers extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [SearchUsers.loadUsers] with the provided parameters.
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

final class _$SearchUsers$LoadUsers
    extends $AsyncMutationBase<void, _$SearchUsers$LoadUsers, SearchUsers>
    implements SearchUsers$LoadUsers {
  _$SearchUsers$LoadUsers(this.element, {super.state, super.key});

  @override
  final _$SearchUsersElement element;

  @override
  $ElementLense<_$SearchUsers$LoadUsers> get listenable => element._$loadUsers;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#loadUsers, []),
      ($notifier) => $notifier.loadUsers(),
    );
  }

  @override
  _$SearchUsers$LoadUsers copyWith(MutationState<void> state, {Object? key}) =>
      _$SearchUsers$LoadUsers(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
