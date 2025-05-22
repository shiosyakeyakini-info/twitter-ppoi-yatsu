import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';

part 'create_note.freezed.dart';
part 'create_note.g.dart';

@freezed
abstract class CreateNotePageData with _$CreateNotePageData {
  const factory CreateNotePageData() = _CreateNotePageData;
}

@riverpod
class CreateNotePageNotifier extends _$CreateNotePageNotifier {
  @override
  CreateNotePageData build() {
    return const CreateNotePageData();
  }

  @mutation
  Future<void> note(String text) async {
    await ref
        .watch(currentMisskeyProvider)
        .notes
        .create(NotesCreateRequest(text: text));
  }
}
