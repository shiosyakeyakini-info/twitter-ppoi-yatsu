import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/businesses/misskey.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

enum TimelineType {
  homeTimeline,
  localTimeline,
  socialTimeline,
  globalTimeline,
}

@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({
    required TimelineType type,
    required List<Note> note,
  }) = _Timeline;
}

@riverpod
class TimelineNotifier extends _$TimelineNotifier {
  late final Misskey misskey;

  Future<Iterable<Note>> _getTimeline() async {
    switch (type) {
      case TimelineType.homeTimeline:
        return misskey.notes.homeTimeline(
          const NotesTimelineRequest(limit: 50),
        );
      case TimelineType.localTimeline:
        return misskey.notes.localTimeline(
          const NotesLocalTimelineRequest(limit: 50),
        );
      case TimelineType.socialTimeline:
        return misskey.notes.hybridTimeline(
          const NotesHybridTimelineRequest(limit: 50),
        );
      case TimelineType.globalTimeline:
        return misskey.notes.globalTimeline(const NotesGlobalTimelineRequest());
    }
  }

  @mutation
  Future<void> updateFromTop() async {
    final Iterable<Note> newNotes;
    switch (type) {
      case TimelineType.homeTimeline:
        newNotes = await misskey.notes.homeTimeline(
          const NotesTimelineRequest(limit: 50),
        );
      case TimelineType.localTimeline:
        newNotes = await misskey.notes.localTimeline(
          const NotesLocalTimelineRequest(limit: 50),
        );
      case TimelineType.socialTimeline:
        newNotes = await misskey.notes.hybridTimeline(
          const NotesHybridTimelineRequest(limit: 50),
        );
      case TimelineType.globalTimeline:
        newNotes = await misskey.notes.globalTimeline(
          const NotesGlobalTimelineRequest(),
        );
    }

    final notes = (state.value?.note ?? []).toList();

    for (final note in newNotes.indexed) {
      if (notes.any((element) => element.id == note.$2.id)) {
        break;
      }
      notes.insert(note.$1, note.$2);
    }
    state = state = AsyncValue.data(state.requireValue.copyWith(note: notes));
  }

  @mutation
  Future<void> updateFromBottom() async {
    final Iterable<Note> oldNotes;
    final lastId = state.requireValue.note.last.id;
    switch (type) {
      case TimelineType.homeTimeline:
        oldNotes = await misskey.notes.homeTimeline(
          NotesTimelineRequest(limit: 50, untilId: lastId),
        );
      case TimelineType.localTimeline:
        oldNotes = await misskey.notes.localTimeline(
          NotesLocalTimelineRequest(limit: 50, untilId: lastId),
        );
      case TimelineType.socialTimeline:
        oldNotes = await misskey.notes.hybridTimeline(
          NotesHybridTimelineRequest(limit: 50, untilId: lastId),
        );
      case TimelineType.globalTimeline:
        oldNotes = await misskey.notes.globalTimeline(
          NotesGlobalTimelineRequest(untilId: lastId),
        );
    }

    final notes = (state.value?.note ?? []).toList();
    state =
        state = AsyncValue.data(
          state.requireValue.copyWith(note: [...notes, ...oldNotes]),
        );
  }

  @override
  Future<Timeline> build(TimelineType type) async {
    misskey = ref.watch(currentMisskeyProvider);

    return Timeline(type: type, note: [...(await _getTimeline())]);
  }
}
