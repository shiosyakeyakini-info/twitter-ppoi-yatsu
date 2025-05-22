import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/route.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
abstract class Login with _$Login {
  const factory Login({required String host, required String apiKey}) = _Login;
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  Login build() {
    return const Login(host: '', apiKey: '');
  }

  void updateHost(String host) => state = state.copyWith(host: host);
  void updateApiKey(String apiKey) => state = state.copyWith(apiKey: apiKey);

  @mutation
  Future<void> login() async {
    await ref
        .read(accountNotifierProvider.notifier)
        .login(state.host, state.apiKey);
    await ref.read(appRouterProvider).push(const TimelineRoute());
  }
}
