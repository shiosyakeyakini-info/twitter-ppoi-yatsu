// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CreateNotePageNotifier)
const createNotePageNotifierProvider = CreateNotePageNotifierProvider._();

final class CreateNotePageNotifierProvider
    extends $NotifierProvider<CreateNotePageNotifier, CreateNotePageData> {
  const CreateNotePageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createNotePageNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createNotePageNotifierHash();

  @$internal
  @override
  CreateNotePageNotifier create() => CreateNotePageNotifier();

  @$internal
  @override
  _$CreateNotePageNotifierElement $createElement($ProviderPointer pointer) =>
      _$CreateNotePageNotifierElement(pointer);

  ProviderListenable<CreateNotePageNotifier$Note> get note =>
      $LazyProxyListenable<CreateNotePageNotifier$Note, CreateNotePageData>(
        this,
        (element) {
          element as _$CreateNotePageNotifierElement;

          return element._$note;
        },
      );

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateNotePageData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<CreateNotePageData>(value),
    );
  }
}

String _$createNotePageNotifierHash() =>
    r'fd52ded94bbbd739b2427ffb2173ed73d4b4029c';

abstract class _$CreateNotePageNotifier extends $Notifier<CreateNotePageData> {
  CreateNotePageData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CreateNotePageData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateNotePageData>,
              CreateNotePageData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$CreateNotePageNotifierElement
    extends
        $NotifierProviderElement<CreateNotePageNotifier, CreateNotePageData> {
  _$CreateNotePageNotifierElement(super.pointer) {
    _$note.result = $Result.data(_$CreateNotePageNotifier$Note(this));
  }
  final _$note = $ElementLense<_$CreateNotePageNotifier$Note>();
  @override
  void mount() {
    super.mount();
    _$note.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$note);
  }
}

sealed class CreateNotePageNotifier$Note extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [CreateNotePageNotifier.note] with the provided parameters.
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
  Future<void> call(String text);
}

final class _$CreateNotePageNotifier$Note
    extends
        $AsyncMutationBase<
          void,
          _$CreateNotePageNotifier$Note,
          CreateNotePageNotifier
        >
    implements CreateNotePageNotifier$Note {
  _$CreateNotePageNotifier$Note(this.element, {super.state, super.key});

  @override
  final _$CreateNotePageNotifierElement element;

  @override
  $ElementLense<_$CreateNotePageNotifier$Note> get listenable => element._$note;

  @override
  Future<void> call(String text) {
    return mutate(
      Invocation.method(#note, [text]),
      ($notifier) => $notifier.note(text),
    );
  }

  @override
  _$CreateNotePageNotifier$Note copyWith(
    MutationState<void> state, {
    Object? key,
  }) => _$CreateNotePageNotifier$Note(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
