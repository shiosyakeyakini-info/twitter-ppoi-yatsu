import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/features/timeline/timeline.dart';

class TimelineContent extends ConsumerWidget {
  const TimelineContent({required this.type, super.key});
  final TimelineType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeline = ref.watch(timelineNotifierProvider(type));
    final topLoad = ref.watch(timelineNotifierProvider(type).updateFromTop);

    return switch (timeline) {
      AsyncLoading() => const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(),
        ),
      ),
      AsyncError() => const Center(child: Text('エラーが発生しました')),
      AsyncData(:final value) => RefreshIndicator(
        child: ListView.separated(
          itemCount: value.note.length + (value.note.isNotEmpty ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < value.note.length) {
              return MisskeyNote(note: value.note[index]);
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
          },
          separatorBuilder:
              (context, index) =>
                  const Divider(color: Color.fromRGBO(239, 243, 244, 1)),
        ),
        onRefresh:
            () =>
                topLoad.state is PendingMutation
                    ? Future.value()
                    : topLoad.call(),
      ),
    };
  }
}

class TimelineBottom extends HookConsumerWidget {
  const TimelineBottom({required this.type, super.key});
  final TimelineType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomLoad = ref.watch(
      timelineNotifierProvider(type).updateFromBottom,
    );

    useEffect(() {
      if (bottomLoad.state is! PendingMutation) {
        bottomLoad.call();
      }
      return null;
    });

    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
