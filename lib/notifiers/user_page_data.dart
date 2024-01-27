import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'user_page_data.freezed.dart';
part 'user_page_data.g.dart';

@freezed
class UserPageData with _$UserPageData {
  const factory UserPageData({
    required UsersShowResponse userDetailed,
    required List<Note> latestNotes,
  }) = _UserPageData;
}

@riverpod
class UserPageDataNotifier extends _$UserPageDataNotifier {
  @override
  Future<UserPageData> build(String userName, String? host) async {
    final userDetailed = await ref
        .read(currentMisskeyProvider)
        .users
        .showByName(UsersShowByUserNameRequest(userName: userName, host: host));

    return UserPageData(
        userDetailed: userDetailed,
        latestNotes: (await ref
                .read(currentMisskeyProvider)
                .users
                .notes(UsersNotesRequest(userId: userDetailed.id)))
            .toList());
  }
}
