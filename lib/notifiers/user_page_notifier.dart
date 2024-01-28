import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'user_page_notifier.freezed.dart';
part 'user_page_notifier.g.dart';

@freezed
class UserPageData with _$UserPageData {
  const factory UserPageData({
    required UserDetailed userDetailed,
    required List<Note> latestNotes,
    @Default([]) List<Note> includeReplyNotes,
    @Default(false) bool isIncludeReplyNotesLoading,
    @Default([]) List<Note> highlightNotes,
    @Default(false) bool isHighlightNotesLoading,
    @Default([]) List<Note> mediaNotes,
    @Default(false) bool isMediaNotesLoading,
    @Default([]) List<Note> reactedNotes,
    @Default(false) bool isReactedNotesLoading,
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

  Future<void> loadUserNotesFromBottom() async {
    final id = state.requireValue.userDetailed.id;
    final notes = await ref.read(currentMisskeyProvider).users.notes(
          UsersNotesRequest(
            userId: id,
            untilId: state.requireValue.latestNotes.last.id,
            withReplies: false,
            withChannelNotes: true,
          ),
        );
    state = AsyncValue.data(state.requireValue
        .copyWith(latestNotes: [...state.requireValue.latestNotes, ...notes]));
  }

  Future<void> loadIncludeReplyNotes() async {
    if (state.requireValue.isIncludeReplyNotesLoading) {
      return;
    }
    state = AsyncValue.data(
        state.requireValue.copyWith(isIncludeReplyNotesLoading: true));
    final notes = await ref.read(currentMisskeyProvider).users.notes(
          UsersNotesRequest(
            userId: state.requireValue.userDetailed.id,
            untilId: state.requireValue.includeReplyNotes.isEmpty
                ? null
                : state.requireValue.includeReplyNotes.last.id,
            withReplies: true,
            withChannelNotes: true,
          ),
        );
    state = AsyncValue.data(state.requireValue.copyWith(
        isIncludeReplyNotesLoading: false,
        includeReplyNotes: [
          ...state.requireValue.includeReplyNotes,
          ...notes
        ]));
  }

  Future<void> loadHighlightNotes() async {
    if (state.requireValue.isHighlightNotesLoading) {
      return;
    }
    state = AsyncValue.data(
        state.requireValue.copyWith(isHighlightNotesLoading: true));
    final notes = await ref.read(currentMisskeyProvider).users.featuredNotes(
          UsersFeaturedNotesRequest(
            userId: state.requireValue.userDetailed.id,
            untilId: state.requireValue.highlightNotes.isEmpty
                ? null
                : state.requireValue.highlightNotes.last.id,
          ),
        );
    state = AsyncValue.data(state.requireValue.copyWith(
        isHighlightNotesLoading: false,
        highlightNotes: [...state.requireValue.highlightNotes, ...notes]));
  }

  Future<void> loadMediaNotes() async {
    if (state.requireValue.isMediaNotesLoading) {
      return;
    }
    state =
        AsyncValue.data(state.requireValue.copyWith(isMediaNotesLoading: true));
    final notes = await ref.read(currentMisskeyProvider).users.notes(
          UsersNotesRequest(
            userId: state.requireValue.userDetailed.id,
            untilId: state.requireValue.mediaNotes.isEmpty
                ? null
                : state.requireValue.mediaNotes.last.id,
            withChannelNotes: true,
            withFiles: true,
          ),
        );
    state = AsyncValue.data(state.requireValue.copyWith(
        isMediaNotesLoading: false,
        mediaNotes: [...state.requireValue.mediaNotes, ...notes]));
  }

  Future<void> loadReactedNotes() async {
    if (state.requireValue.isReactedNotesLoading) {
      return;
    }
    state = AsyncValue.data(
        state.requireValue.copyWith(isReactedNotesLoading: true));
    final notes = await ref.read(currentMisskeyProvider).users.reactions(
          UsersReactionsRequest(
            userId: state.requireValue.userDetailed.id,
            untilId: state.requireValue.reactedNotes.isEmpty
                ? null
                : state.requireValue.reactedNotes.last.id,
          ),
        );
    state = AsyncValue.data(
      state.requireValue.copyWith(
        isReactedNotesLoading: false,
        highlightNotes: [
          ...state.requireValue.reactedNotes,
          ...notes.map((e) => e.note)
        ],
      ),
    );
  }
}
