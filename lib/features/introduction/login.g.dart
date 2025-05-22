// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(LoginNotifier)
const loginNotifierProvider = LoginNotifierProvider._();

final class LoginNotifierProvider
    extends $NotifierProvider<LoginNotifier, Login> {
  const LoginNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginNotifierHash();

  @$internal
  @override
  LoginNotifier create() => LoginNotifier();

  @$internal
  @override
  _$LoginNotifierElement $createElement($ProviderPointer pointer) =>
      _$LoginNotifierElement(pointer);

  ProviderListenable<LoginNotifier$Login> get login =>
      $LazyProxyListenable<LoginNotifier$Login, Login>(this, (element) {
        element as _$LoginNotifierElement;

        return element._$login;
      });

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Login value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Login>(value),
    );
  }
}

String _$loginNotifierHash() => r'04cea737d2b6050b8cc9c45c4fd1d8d2c283f231';

abstract class _$LoginNotifier extends $Notifier<Login> {
  Login build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Login>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Login>,
              Login,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

class _$LoginNotifierElement
    extends $NotifierProviderElement<LoginNotifier, Login> {
  _$LoginNotifierElement(super.pointer) {
    _$login.result = $Result.data(_$LoginNotifier$Login(this));
  }
  final _$login = $ElementLense<_$LoginNotifier$Login>();
  @override
  void mount() {
    super.mount();
    _$login.result!.value!.reset();
  }

  @override
  void visitListenables(
    void Function($ElementLense element) listenableVisitor,
  ) {
    super.visitListenables(listenableVisitor);

    listenableVisitor(_$login);
  }
}

sealed class LoginNotifier$Login extends MutationBase<void> {
  /// Starts the mutation.
  ///
  /// This will first set the state to [PendingMutation], then
  /// will call [LoginNotifier.login] with the provided parameters.
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

final class _$LoginNotifier$Login
    extends $AsyncMutationBase<void, _$LoginNotifier$Login, LoginNotifier>
    implements LoginNotifier$Login {
  _$LoginNotifier$Login(this.element, {super.state, super.key});

  @override
  final _$LoginNotifierElement element;

  @override
  $ElementLense<_$LoginNotifier$Login> get listenable => element._$login;

  @override
  Future<void> call() {
    return mutate(
      Invocation.method(#login, []),
      ($notifier) => $notifier.login(),
    );
  }

  @override
  _$LoginNotifier$Login copyWith(MutationState<void> state, {Object? key}) =>
      _$LoginNotifier$Login(element, state: state, key: key);
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
