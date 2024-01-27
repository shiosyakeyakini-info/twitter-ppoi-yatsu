import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/account.dart';

part 'misskey.g.dart';

@riverpod
Misskey misskey(
  MisskeyRef ref, {
  required String? token,
  required String host,
}) {
  return Misskey(token: token, host: host);
}

@riverpod
Misskey currentMisskey(CurrentMisskeyRef ref) {
  final account = ref.watch(accountNotifierProvider).requireValue!;
  return ref.read(misskeyProvider(host: account.host, token: account.token));
}
