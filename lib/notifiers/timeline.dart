import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/notifiers/misskey.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

enum TimelineType {
  homeTimeline,
  localTimeline,
  socialTimeline,
  globalTimeline
}

@freezed
class Timeline with _$Timeline {
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
        return misskey.notes
            .homeTimeline(const NotesTimelineRequest(limit: 50));
      case TimelineType.localTimeline:
        return misskey.notes
            .localTimeline(const NotesLocalTimelineRequest(limit: 50));
      case TimelineType.socialTimeline:
        return misskey.notes
            .hybridTimeline(const NotesHybridTimelineRequest(limit: 50));
      case TimelineType.globalTimeline:
        return misskey.notes.globalTimeline(const NotesGlobalTimelineRequest());
    }
  }

  Future updateFromTop() async {
    final Iterable<Note> newNotes;
    switch (type) {
      case TimelineType.homeTimeline:
        newNotes = await misskey.notes
            .homeTimeline(const NotesTimelineRequest(limit: 50));
      case TimelineType.localTimeline:
        newNotes = await misskey.notes
            .localTimeline(const NotesLocalTimelineRequest(limit: 50));
      case TimelineType.socialTimeline:
        newNotes = await misskey.notes
            .hybridTimeline(const NotesHybridTimelineRequest(limit: 50));
      case TimelineType.globalTimeline:
        newNotes = await misskey.notes
            .globalTimeline(const NotesGlobalTimelineRequest());
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

  @override
  Future<Timeline> build(TimelineType type) async {
    misskey = ref.watch(currentMisskeyProvider);

    return Timeline(type: type, note: (await _getTimeline()).toList());
  }
}
