import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';

part 'search_note_page_notifier.freezed.dart';
part 'search_note_page_notifier.g.dart';

@riverpod
Future<List<UserDetailed>> pinnedUser(Ref ref) async {
  return [...await ref.read(currentMisskeyProvider).pinnedUsers()];
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  @override
  set state(String query) => state = query;
}

@freezed
abstract class FeaturedNotesState with _$FeaturedNotesState {
  const factory FeaturedNotesState({
    @Default([]) List<Note> notes,
    @Default(false) bool isLatestNoteReachedLast,
  }) = _FeaturedNotesState;
}

@riverpod
class FeaturedNotes extends _$FeaturedNotes {
  @override
  Future<FeaturedNotesState> build() async {
    // 検索語句が変わったら初期化する
    ref.listen(searchQueryProvider, (_, next) async {
      await future;
      state = const AsyncData(FeaturedNotesState());
    });

    return FeaturedNotesState(
      notes: [
        ...await ref
            .read(currentMisskeyProvider)
            .notes
            .featured(const NotesFeaturedRequest()),
      ],
    );
  }

  @mutation
  Future<void> loadFeaturedNotes() async {
    final previous = await future;
    final notes = await ref
        .read(currentMisskeyProvider)
        .notes
        .featured(
          NotesFeaturedRequest(
            untilId: previous.notes.isEmpty ? null : previous.notes.last.id,
          ),
        );
    state = AsyncData(
      state.requireValue.copyWith(
        notes: [...state.requireValue.notes, ...notes],
        isLatestNoteReachedLast: notes.isEmpty,
      ),
    );
  }
}

@freezed
abstract class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState({
    @Default([]) List<UserDetailed> users,
    @Default(false) isUsersReachedLast,
  }) = _SearchUsersState;
}

@riverpod
class SearchUsers extends _$SearchUsers {
  @override
  SearchUsersState build() {
    // 検索語句が変わったら初期化する
    ref.listen(searchQueryProvider, (_, next) {
      state = const SearchUsersState();
    });

    return const SearchUsersState();
  }

  @mutation
  Future<void> loadUsers() async {
    final query = ref.read(searchQueryProvider);
    final users = await ref
        .read(currentMisskeyProvider)
        .users
        .search(
          UsersSearchRequest(
            query: query,
            offset: query.isEmpty ? null : state.users.length,
            origin: Origin.combined,
            detail: true,
          ),
        );
    state = state.copyWith(
      users: [...state.users, ...users.cast<UserDetailed>()],
      isUsersReachedLast: users.isEmpty,
    );
  }
}
