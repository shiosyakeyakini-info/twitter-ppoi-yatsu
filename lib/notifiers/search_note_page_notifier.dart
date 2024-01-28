import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'search_note_page_notifier.freezed.dart';
part 'search_note_page_notifier.g.dart';

@freezed
class SearchNotePageData with _$SearchNotePageData {
  const factory SearchNotePageData({
    required List<Note> latestNotes,
    @Default(false) isLoadingLatestNotes,
    @Default(false) isLatestNoteReachedLast,
    required List<UserDetailed> users,
    @Default(false) isLoadingUsers,
    @Default(false) isLoadingUsersReachedLast,
    required String searchWord,
    required List<Note> featuredNotes,
    @Default(false) isLoadingFeaturedNotes,
    @Default(false) isLoadingFeaturedNotesReachedLast,
    @Default(false) isLoadingPinnedUsers,
    required List<UserDetailed> pinnedUsers,
  }) = _SearchNotePageData;
}

@riverpod
class SearchNotePageNotifier extends _$SearchNotePageNotifier {
  @override
  SearchNotePageData build() {
    Future(() async {
      final featuredNotes = await ref
          .read(currentMisskeyProvider)
          .notes
          .featured(const NotesFeaturedRequest());
      state = state.copyWith(featuredNotes: featuredNotes.toList());
    });

    return const SearchNotePageData(
        latestNotes: [],
        users: [],
        searchWord: "",
        featuredNotes: [],
        pinnedUsers: []);
  }

  Future<void> loadFeaturedNotes() async {
    if (state.isLoadingFeaturedNotes ||
        state.isLoadingFeaturedNotesReachedLast) {
      return;
    }
    state = state.copyWith(isLoadingFeaturedNotes: true);
    final notes = await ref.read(currentMisskeyProvider).notes.featured(
          NotesFeaturedRequest(
            untilId: state.featuredNotes.isEmpty
                ? null
                : state.featuredNotes.last.id,
          ),
        );
    state = state.copyWith(
        isLoadingFeaturedNotes: false,
        featuredNotes: [
          ...state.featuredNotes,
          ...notes,
        ],
        isLoadingFeaturedNotesReachedLast: notes.isEmpty);
  }

  Future<void> loadPinnedUser() async {
    if (state.pinnedUsers.isNotEmpty || state.isLatestNoteReachedLast) {
      return;
    }
    state = state.copyWith(isLoadingPinnedUsers: true);

    final users = await ref.read(currentMisskeyProvider).pinnedUsers();
    state = state.copyWith(
      pinnedUsers: users.toList(),
      isLoadingPinnedUsers: false,
    );
  }

  Future<void> loadLatestNotes() async {
    if (state.isLatestNoteReachedLast || state.isLoadingLatestNotes) {
      return;
    }
    state = state.copyWith(isLoadingFeaturedNotes: true);
    final notes = await ref.read(currentMisskeyProvider).notes.search(
          NotesSearchRequest(
            query: state.searchWord,
            untilId: state.featuredNotes.isEmpty
                ? null
                : state.featuredNotes.last.id,
          ),
        );
    state = state.copyWith(
        isLoadingFeaturedNotes: false,
        latestNotes: [
          ...state.latestNotes,
          ...notes,
        ],
        isLatestNoteReachedLast: notes.isEmpty);
  }

  Future<void> loadUsers() async {
    if (state.isLoadingUsersReachedLast || state.isLoadingUsers) {
      return;
    }
    state = state.copyWith(isLoadingUsers: true);
    final users = await ref.read(currentMisskeyProvider).users.search(
          UsersSearchRequest(
            query: state.searchWord,
            offset: state.featuredNotes.isEmpty ? null : state.users.length,
            origin: Origin.combined,
            detail: true,
          ),
        );
    state = state.copyWith(
        isLoadingUsers: false,
        users: [
          ...state.users,
          ...users.cast<UserDetailed>(),
        ],
        isLoadingUsersReachedLast: users.isEmpty);
  }

  void updateSearchText(String query) {
    state = state.copyWith(
      searchWord: query,
      isLatestNoteReachedLast: false,
      isLoadingUsersReachedLast: false,
      isLoadingLatestNotes: false,
      isLoadingUsers: false,
      users: [],
      latestNotes: [],
    );
  }
}
