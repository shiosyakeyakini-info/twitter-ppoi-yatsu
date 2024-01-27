import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/notifiers/timeline.dart';

class TimelineContent extends ConsumerStatefulWidget {
  final TimelineType type;

  const TimelineContent({
    super.key,
    required this.type,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TimelineContentState();
}

class TimelineContentState extends ConsumerState<TimelineContent> {
  @override
  Widget build(BuildContext context) {
    final timeline = ref.watch(timelineNotifierProvider(widget.type)).value;

    if (timeline == null) {
      return const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return RefreshIndicator(
      child: ListView.separated(
        itemCount: timeline.note.length,
        itemBuilder: (context, index) =>
            MisskeyNote(note: timeline.note[index]),
        separatorBuilder: (context, index) => const Divider(
          color: Color.fromRGBO(239, 243, 244, 1),
        ),
      ),
      onRefresh: () async {
        ref
            .watch(timelineNotifierProvider(widget.type).notifier)
            .updateFromTop();
      },
    );
  }
}
