import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';

part 'user_basic_notifier.freezed.dart';
part 'user_basic_notifier.g.dart';

@freezed
abstract class UserBasicState with _$UserBasicState {
  const factory UserBasicState({
    required UserDetailed userDetailed,
    required List<Note> latestNotes,
  }) = _UserBasicState;
}

@riverpod
class UserBasicNotifier extends _$UserBasicNotifier {
  @override
  Future<UserBasicState> build(String? host, String userName) async {
    final userDetailed = await ref
        .read(currentMisskeyProvider)
        .users
        .showByName(UsersShowByUserNameRequest(userName: userName, host: host));

    final notes = await ref
        .read(currentMisskeyProvider)
        .users
        .notes(UsersNotesRequest(userId: userDetailed.id));

    return UserBasicState(userDetailed: userDetailed, latestNotes: [...notes]);
  }

  @mutation
  Future<void> loadMoreNotes() async {
    final currentState = await future;
    final notes = await ref
        .read(currentMisskeyProvider)
        .users
        .notes(
          UsersNotesRequest(
            userId: currentState.userDetailed.id,
            untilId: currentState.latestNotes.last.id,
            withReplies: false,
            withChannelNotes: true,
          ),
        );

    state = AsyncValue.data(
      state.requireValue.copyWith(
        latestNotes: [...currentState.latestNotes, ...notes],
      ),
    );
  }
}
