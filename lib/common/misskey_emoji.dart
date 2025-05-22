import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tweekey/businesses/account.dart';

class MisskeyEmoji extends ConsumerWidget {
  const MisskeyEmoji({
    required this.shortCode,
    required this.style,
    super.key,
    this.remoteReactions,
    this.isSameSize = false,
  });
  final String shortCode;
  final TextStyle style;
  final bool isSameSize;

  final Map<String, String>? remoteReactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emoji =
        remoteReactions?.entries
            .firstWhereOrNull((e) => e.key == shortCode)
            ?.value ??
        ref
            .watch(
              accountNotifierProvider.select((value) => value.requireValue!),
            )
            .emoji
            .firstWhereOrNull((element) => element.name == shortCode)
            ?.url
            .toString();

    if (emoji == null) {
      return Text.rich(TextSpan(text: ':$shortCode:'));
    }

    return Image.network(
      emoji,
      height: isSameSize ? style.fontSize : (style.fontSize ?? 22) * 2,
      errorBuilder:
          (context, e, s) => Text.rich(TextSpan(text: ':$shortCode:')),
    );
  }
}
