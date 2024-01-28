import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mfm/mfm.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/common/continue_list_view.dart';
import 'package:tweekey/common/misskey_emoji.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/notifiers/account.dart';
import 'package:tweekey/notifiers/user_page_notifier.dart';

@RoutePage()
class UserPage extends ConsumerStatefulWidget {
  final String userName;
  final String? host;

  const UserPage({
    super.key,
    required this.userName,
    required this.host,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserPageState();
}

class UserPageState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(userPageDataNotifierProvider(widget.userName, widget.host));

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: SizedBox(
              width: 100, height: 100, child: CircularProgressIndicator()),
        ),
      );
    }

    final data = state.valueOrNull;

    if (data == null) {
      return Scaffold(appBar: AppBar(), body: Text("なんかおかしい"));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, isnantoka) => [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Transform.translate(
                  offset: const Offset(0.0, 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleMfm(
                        data.userDetailed.name ?? data.userDetailed.username,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        emojiBuilder: (context, shortCode, style) =>
                            MisskeyEmoji(
                          shortCode: shortCode,
                          style: style ?? const TextStyle(),
                          isSameSize: true,
                          remoteReactions: data.userDetailed.emojis,
                        ),
                      ),
                      Text(
                        "${data.userDetailed.notesCount}件のツイート",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                background: SizedBox(
                  height: 190,
                  child: Stack(children: [
                    data.userDetailed.bannerUrl != null
                        ? Image.network(data.userDetailed.bannerUrl!.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150)
                        : SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor)),
                          ),
                    Positioned(
                      left: 10,
                      top: 125,
                      width: 70,
                      height: 70,
                      child: DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 6),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: AvatarIcon(
                            avatarUrl: data.userDetailed.avatarUrl,
                            width: 64,
                            height: 64,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleMfm(
                          data.userDetailed.name ?? data.userDetailed.username,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          emojiBuilder: (context, shortCode, style) =>
                              MisskeyEmoji(
                            shortCode: shortCode,
                            style: style ?? const TextStyle(),
                            isSameSize: true,
                            remoteReactions: data.userDetailed.emojis,
                          ),
                        ),
                        Text(
                          "@${data.userDetailed.username}${data.userDetailed.host == null ? "" : "@${data.userDetailed.host}"}",
                          style: const TextStyle(color: unDetailedColor),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Mfm(
                          mfmText: data.userDetailed.description ?? "",
                          emojiBuilder: (context, shortCode, style) =>
                              MisskeyEmoji(
                            shortCode: shortCode,
                            style: style ?? const TextStyle(),
                            remoteReactions: data.userDetailed.emojis,
                          ),
                        ),
                        if (data.userDetailed.location != null) ...[
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            children: [
                              Icon(Icons.place,
                                  color: unDetailedColor,
                                  size: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .fontSize!),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                              ),
                              Text(
                                data.userDetailed.location!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: unDetailedColor),
                              )
                            ],
                          ),
                        ],
                        if (data.userDetailed.birthday != null) ...[
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.birthdayCake,
                                  color: unDetailedColor,
                                  size: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .fontSize!),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                              ),
                              Text(
                                DateFormat("誕生日   yyyy/MM/dd")
                                    .format(data.userDetailed.birthday!),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: unDetailedColor),
                              )
                            ],
                          ),
                        ],
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Icon(Icons.schedule_outlined,
                                color: unDetailedColor,
                                size: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .fontSize!),
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Text(
                              "${DateFormat("yyyy年MM月").format(data.userDetailed.createdAt)}から${data.userDetailed.instance?.name ?? ref.read(accountNotifierProvider).requireValue!.meta.name}を利用しています",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: unDetailedColor),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Mfm(
                          mfmText:
                              "<b>\$[fg.color=000 ${data.userDetailed.followingCount}]</b> フォロー中   <b>\$[fg.color=000 ${data.userDetailed.followersCount}]</b> フォロワー",
                          style: const TextStyle(color: unDetailedColor),
                        ),
                      ],
                    ),
                  ),
                  const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "ツイート"),
                      Tab(text: "返信"),
                      Tab(text: "ハイライト"),
                      Tab(text: "メディア"),
                      Tab(text: "お気に入り"),
                    ],
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(children: [
            UserTweets(userName: widget.userName, host: widget.host),
            UserReplyTweets(userName: widget.userName, host: widget.host),
            UserHighlightNotes(userName: widget.userName, host: widget.host),
            UserMediaNotes(userName: widget.userName, host: widget.host),
            UserReactedNotes(userName: widget.userName, host: widget.host)
          ]),
        ),
      ),
    );
  }
}

class UserTweets extends ConsumerWidget {
  final String userName;
  final String? host;

  const UserTweets({super.key, required this.userName, required this.host});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.latestNotes));
    final pinnedNotes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.userDetailed.pinnedNotes));

    if (notes == null || pinnedNotes == null) {
      return const SizedBox.shrink();
    }

    final targetNotes = [...pinnedNotes, ...notes];

    return ContinueListView(
      itemCount: targetNotes.length,
      itemBuilder: (context, index) => index >= pinnedNotes.length
          ? MisskeyNote(note: targetNotes[index])
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                    ),
                    FaIcon(
                      FontAwesomeIcons.thumbtack,
                      color: unDetailedColor,
                      size:
                          Theme.of(context).textTheme.bodySmall!.fontSize ?? 22,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text(
                      "固定",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: unDetailedColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                MisskeyNote(note: targetNotes[index])
              ],
            ),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadUserNotesFromBottom();
      },
    );
  }
}

class UserReplyTweets extends ConsumerWidget {
  final String userName;
  final String? host;

  const UserReplyTweets(
      {super.key, required this.userName, required this.host});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.includeReplyNotes));

    if (notes == null) {
      return const SizedBox.shrink();
    }
    if (notes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadIncludeReplyNotes();
      });
    }

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadIncludeReplyNotes();
      },
    );
  }
}

class UserHighlightNotes extends ConsumerWidget {
  final String userName;
  final String? host;

  const UserHighlightNotes(
      {super.key, required this.userName, required this.host});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.highlightNotes));

    if (notes == null) {
      return const SizedBox.shrink();
    }
    if (notes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadHighlightNotes();
      });
    }

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadHighlightNotes();
      },
    );
  }
}

class UserMediaNotes extends ConsumerWidget {
  final String userName;
  final String? host;

  const UserMediaNotes({super.key, required this.userName, required this.host});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.mediaNotes));

    if (notes == null) {
      return const SizedBox.shrink();
    }
    if (notes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadMediaNotes();
      });
    }

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadMediaNotes();
      },
    );
  }
}

class UserReactedNotes extends ConsumerWidget {
  final String userName;
  final String? host;

  const UserReactedNotes(
      {super.key, required this.userName, required this.host});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(UserPageDataNotifierProvider(userName, host)
        .select((value) => value.valueOrNull?.reactedNotes));

    if (notes == null) {
      return const SizedBox.shrink();
    }
    if (notes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadReactedNotes();
      });
    }

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref
            .watch(UserPageDataNotifierProvider(userName, host).notifier)
            .loadReactedNotes();
      },
    );
  }
}
