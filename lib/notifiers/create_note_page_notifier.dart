import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'create_note_page_notifier.freezed.dart';
part 'create_note_page_notifier.g.dart';

@freezed
class CreateNotePageData with _$CreateNotePageData {
  const factory CreateNotePageData({
    required String tweet,
    required bool isNoteCreating,
  }) = _CreateNotePageData;
}

@riverpod
class CreateNotePageNotifier extends _$CreateNotePageNotifier {
  @override
  CreateNotePageData build() {
    return const CreateNotePageData(tweet: "", isNoteCreating: false);
  }

  void updateNote(String text) {
    state = state.copyWith(tweet: text);
  }

  Future<void> note() async {
    state = state.copyWith(isNoteCreating: true);
    await ref
        .watch(currentMisskeyProvider)
        .notes
        .create(NotesCreateRequest(text: state.tweet));
    state = state.copyWith(isNoteCreating: false);
  }
}
