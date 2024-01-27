import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/notifiers/account.dart';

class MisskeyEmoji extends ConsumerWidget {
  final String shortCode;
  final TextStyle style;
  final bool isSameSize;

  final Map<String, String>? remoteReactions;

  const MisskeyEmoji({
    super.key,
    required this.shortCode,
    required this.style,
    this.remoteReactions,
    this.isSameSize = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emoji = remoteReactions?.entries
            .firstWhereOrNull((e) => e.key == shortCode)
            ?.value ??
        ref
            .watch(
                accountNotifierProvider.select((value) => value.requireValue!))
            .emoji
            .firstWhereOrNull((element) => element.name == shortCode)
            ?.url
            .toString();

    if (emoji == null) {
      return Text.rich(TextSpan(text: ":$shortCode:"));
    }

    return Image.network(
      emoji,
      height: isSameSize ? style.fontSize : (style.fontSize ?? 22) * 2,
      errorBuilder: (context, e, s) =>
          Text.rich(TextSpan(text: ":$shortCode:")),
    );
  }
}
