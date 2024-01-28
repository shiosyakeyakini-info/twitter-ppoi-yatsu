import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required String token,
    required String host,
    required MeDetailed i,
    required MetaResponse meta,
    required List<Emoji> emoji,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@riverpod
class AccountNotifier extends _$AccountNotifier {
  @override
  Future<Account?> build() async {
    const storage = FlutterSecureStorage();
    try {
      final accountData = await storage.read(key: "TweekeyAccount");
      if (accountData == null) {
        return null;
      }
      final account = Account.fromJson(jsonDecode(accountData));

      return account.copyWith(
        i: await ref
            .read(misskeyProvider(host: account.host, token: account.token))
            .i
            .i(),
        meta: await ref
            .read(misskeyProvider(host: account.host, token: account.token))
            .meta(),
        emoji: (await ref
                .read(misskeyProvider(host: account.host, token: account.token))
                .emojis())
            .emojis,
      );
    } catch (e) {
      return null;
    }
  }

  Future login(String host, String token) async {
    final account = Account(
      host: host,
      token: token,
      i: await ref.read(misskeyProvider(host: host, token: token)).i.i(),
      meta: await ref.read(misskeyProvider(host: host, token: token)).meta(),
      emoji:
          (await ref.read(misskeyProvider(host: host, token: token)).emojis())
              .emojis,
    );

    await const FlutterSecureStorage()
        .write(key: "TweekeyAccount", value: jsonEncode(account.toJson()));

    state = AsyncValue.data(account);
  }
}
