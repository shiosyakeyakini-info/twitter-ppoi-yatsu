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
    final timeline = ref.watch(timelineNotifierProvider(widget.type)
        .select((value) => value.value?.note));

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
        itemCount: timeline.length + (timeline.isNotEmpty ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < timeline.length) {
            return MisskeyNote(note: timeline[index]);
          } else {
            if (ref
                    .read(timelineNotifierProvider(widget.type))
                    .valueOrNull
                    ?.isTimelineBottomLoaded !=
                true) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ref
                    .read(timelineNotifierProvider(widget.type).notifier)
                    .updateFromBottom();
              });
            }

            return const Center(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
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
