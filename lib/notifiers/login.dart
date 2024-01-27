import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/account.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String host,
    required String apiKey,
    required bool isLoginDone,
    String? loginErrorMessage,
  }) = _Login;
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  Login build() {
    return const Login(
      host: "",
      apiKey: "",
      loginErrorMessage: null,
      isLoginDone: false,
    );
  }

  void updateHost(String host) => state = state.copyWith(host: host);
  void updateApiKey(String apiKey) => state = state.copyWith(apiKey: apiKey);

  Future<void> login() async {
    try {
      await ref.read(accountNotifierProvider.notifier).login(
            state.host,
            state.apiKey,
          );
      state = state.copyWith(isLoginDone: true);
    } catch (e) {
      state = state.copyWith(loginErrorMessage: e.toString());
    }
  }
}
