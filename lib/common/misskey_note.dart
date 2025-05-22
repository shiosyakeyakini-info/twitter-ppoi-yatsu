import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mfm/mfm.dart';
import 'package:mfm_parser/mfm_parser.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/common/misskey_emoji.dart';
import 'package:tweekey/common/misskey_note_media.dart';
import 'package:tweekey/common/renote_modal_sheet.dart';
import 'package:tweekey/extensions/date_time_extension.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/route.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MisskeyNote extends ConsumerStatefulWidget {
  const MisskeyNote({
    required this.note,
    super.key,
    this.isQuoted = false,
    this.isReplyTarget = false,
  });
  final Note note;
  final bool isQuoted;
  final bool isReplyTarget;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MisskeyNoteState();
}

class MisskeyNoteState extends ConsumerState<MisskeyNote> {
  late List<MfmNode> userNameNode = const MfmParser().parseSimple(
    widget.note.user.name ?? widget.note.user.username,
  );
  late bool isCwOpen = false;

  @override
  void didUpdateWidget(covariant MisskeyNote oldWidget) {
    userNameNode = const MfmParser().parseSimple(
      widget.note.user.name ?? widget.note.user.username,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final renote = widget.note.renote;
    final isCwHidden = !isCwOpen && (widget.note.cw?.isNotEmpty ?? false);
    // 空のリツイートの場合
    if (renote != null &&
        widget.note.text == null &&
        widget.note.files.isEmpty &&
        widget.note.poll == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 30)),
              FaIcon(
                FontAwesomeIcons.retweet,
                color: unDetailedColor,
                size: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 22,
              ),
              const Padding(padding: EdgeInsets.only(left: 5)),
              Expanded(
                child: Mfm(
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: unDetailedColor,
                    fontWeight: FontWeight.bold,
                  ),
                  mfmNode: [MfmBold(userNameNode.cast()), MfmText('さんがリツイート')],
                  overflow: TextOverflow.ellipsis,
                  emojiBuilder:
                      (context, shortCode, style) => MisskeyEmoji(
                        shortCode: shortCode,
                        style: style ?? const TextStyle(),
                        remoteReactions: widget.note.user.emojis,
                        isSameSize: true,
                      ),
                ),
              ),
            ],
          ),
          MisskeyNote(note: renote),
        ],
      );
    }

    return Column(
      children: [
        if (widget.note.reply != null) ...[
          MisskeyNote(note: widget.note.reply!, isReplyTarget: true),
          const Padding(padding: EdgeInsets.only(top: 10)),
        ],
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap:
                    () => context.pushRoute(
                      UserRoute(
                        userName: widget.note.user.username,
                        host: widget.note.user.host,
                      ),
                    ),
                child: AvatarIcon(avatarUrl: widget.note.user.avatarUrl),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Mfm(
                            mfmNode: [
                              MfmBold(userNameNode.cast()),
                              MfmFn(
                                name: 'fg',
                                args: {'color': unDetailedColor.hex},
                                children: [
                                  MfmText(
                                    "  @${widget.note.user.username}${widget.note.user.host == null ? "" : "@${widget.note.user.host}"}",
                                  ),
                                ],
                              ),
                            ],
                            overflow: TextOverflow.ellipsis,
                            emojiBuilder:
                                (context, shortCode, style) => MisskeyEmoji(
                                  shortCode: shortCode,
                                  style: style ?? const TextStyle(),
                                  isSameSize: true,
                                  remoteReactions: widget.note.user.emojis,
                                ),
                          ),
                        ),
                        Text(
                          widget.note.createdAt.positionalTimeString,
                          style: const TextStyle(color: unDetailedColor),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        if (!widget.isQuoted)
                          IconButton(
                            onPressed: () {},
                            padding: const EdgeInsets.only(top: 2),
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              Icons.more_horiz,
                              color: unDetailedColor,
                              size: MediaQuery.of(context).textScaler.scale(16),
                            ),
                          ),
                      ],
                    ),
                    if (widget.note.reply != null) ...[
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '返信先: ',
                              style: TextStyle(color: unDetailedColor),
                            ),
                            TextSpan(
                              text:
                                  "@${widget.note.reply!.user.username}${widget.note.reply!.user.host == null ? "" : "@${widget.note.reply!.user.host}"}さん",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                    ],
                    if (widget.note.cw?.isNotEmpty == true)
                      Mfm(
                        mfmText: widget.note.cw,
                        suffixSpan: [
                          TextSpan(
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap =
                                      () => setState(() => isCwOpen = true),
                            text: '続きを見る',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    if (widget.note.text != null && !isCwHidden)
                      Mfm(
                        mfmText: widget.note.text,
                        emojiBuilder:
                            (context, shortCode, style) => MisskeyEmoji(
                              shortCode: shortCode,
                              style: style ?? const TextStyle(),
                              remoteReactions: widget.note.emojis,
                            ),
                        mentionTap:
                            (username, host, acct) => context.pushRoute(
                              UserRoute(userName: username, host: host),
                            ),
                        linkTap: launchUrlString,
                      ),
                    const Padding(padding: EdgeInsets.only(top: 2)),
                    if (widget.note.files.isNotEmpty && !isCwHidden) ...[
                      MisskeyNoteMedia(files: widget.note.files),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                    ],
                    if (widget.note.renote != null &&
                        !widget.isQuoted &&
                        !isCwHidden) ...[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: lightBorder),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: MisskeyNote(
                            note: widget.note.renote!,
                            isQuoted: true,
                          ),
                        ),
                      ),
                    ],
                    if (!widget.isQuoted)
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.reply,
                                color: unDetailedColor,
                                size: MediaQuery.of(
                                  context,
                                ).textScaler.scale(16),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 3)),
                            Text(
                              widget.note.repliesCount.toString(),
                              style: const TextStyle(color: unDetailedColor),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed:
                                  () async => showModalBottomSheet(
                                    context: context,
                                    builder:
                                        (context) => const RenoteModalSheet(),
                                  ),
                              icon: Icon(
                                Icons.repeat_rounded,
                                color: unDetailedColor,
                                size: MediaQuery.of(
                                  context,
                                ).textScaler.scale(16),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 3)),
                            Text(
                              widget.note.renoteCount.toString(),
                              style: const TextStyle(color: unDetailedColor),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.face_outlined,
                                color: unDetailedColor,
                                size: MediaQuery.of(
                                  context,
                                ).textScaler.scale(16),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 3)),
                            Text(
                              widget.note.reactions.values.sum.toString(),
                              style: const TextStyle(color: unDetailedColor),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.ios_share,
                                color: unDetailedColor,
                                size: MediaQuery.of(
                                  context,
                                ).textScaler.scale(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
