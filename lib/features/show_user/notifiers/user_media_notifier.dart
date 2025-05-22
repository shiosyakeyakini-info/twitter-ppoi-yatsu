import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';
import 'package:tweekey/features/show_user/notifiers/user_basic_notifier.dart';

part 'user_media_notifier.g.dart';

@riverpod
class UserMediaNotifier extends _$UserMediaNotifier {
  @override
  Future<List<Note>> build(String? host, String userName) async {
    final userDetail = await ref.watch(
      userBasicNotifierProvider(host, userName).future,
    );
    return [
      ...await ref
          .read(currentMisskeyProvider)
          .users
          .notes(
            UsersNotesRequest(
              userId: userDetail.userDetailed.id,
              withChannelNotes: true,
              withFiles: true,
            ),
          ),
    ];
  }

  @mutation
  Future<void> loadMoreMediaNotes() async {
    await future;
    final userDetail = await ref.watch(
      userBasicNotifierProvider(host, userName).future,
    );
    state = AsyncData([
      ...state.requireValue,
      ...await ref
          .read(currentMisskeyProvider)
          .users
          .notes(
            UsersNotesRequest(
              userId: userDetail.userDetailed.id,
              untilId: state.requireValue.last.id,
              withChannelNotes: true,
              withFiles: true,
            ),
          ),
    ]);
  }
}
