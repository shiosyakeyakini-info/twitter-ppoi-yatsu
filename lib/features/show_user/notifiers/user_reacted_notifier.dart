import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';
import 'package:tweekey/features/show_user/notifiers/user_basic_notifier.dart';

part 'user_reacted_notifier.g.dart';

@riverpod
class UserReactedNotifier extends _$UserReactedNotifier {
  @override
  Future<List<Note>> build(String? host, String userName) async {
    final userDetailed = await ref.read(
      userBasicNotifierProvider(host, userName).future,
    );
    final response = await ref
        .read(currentMisskeyProvider)
        .users
        .reactions(UsersReactionsRequest(userId: userDetailed.userDetailed.id));
    return [...response.map((e) => e.note)];
  }

  @mutation
  Future<void> loadReactedNotes() async {
    final userDetailed = await ref.read(
      userBasicNotifierProvider(host, userName).future,
    );

    final response = await ref
        .read(currentMisskeyProvider)
        .users
        .reactions(
          UsersReactionsRequest(
            userId: userDetailed.userDetailed.id,
            untilId: state.requireValue.last.id,
          ),
        );
    state = AsyncData([...state.requireValue, ...response.map((e) => e.note)]);
  }
}
