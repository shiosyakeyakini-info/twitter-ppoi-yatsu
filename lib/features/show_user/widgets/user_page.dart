import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mfm/mfm.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/common/continue_list_view.dart';
import 'package:tweekey/common/misskey_emoji.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/features/show_user/notifiers/user_basic_notifier.dart';
import 'package:tweekey/features/show_user/notifiers/user_highlight_notifier.dart';
import 'package:tweekey/features/show_user/notifiers/user_media_notifier.dart';
import 'package:tweekey/features/show_user/notifiers/user_reacted_notifier.dart';
import 'package:tweekey/features/show_user/notifiers/user_reply_notifier.dart';
import 'package:tweekey/main.dart';

@RoutePage()
class UserPage extends ConsumerWidget {
  const UserPage({required this.userName, required this.host, super.key});
  final String? host;
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userBasicNotifierProvider(host, userName));

    return switch (state) {
      AsyncLoading() => const Scaffold(
        body: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      AsyncError() => Scaffold(appBar: AppBar(), body: const Text('なんかおかしい')),
      AsyncData(:final value) => Scaffold(
        extendBodyBehindAppBar: true,
        body: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (context, isnantoka) => [
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Transform.translate(
                        offset: const Offset(0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SimpleMfm(
                              value.userDetailed.name ??
                                  value.userDetailed.username,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              emojiBuilder:
                                  (context, shortCode, style) => MisskeyEmoji(
                                    shortCode: shortCode,
                                    style: style ?? const TextStyle(),
                                    isSameSize: true,
                                    remoteReactions: value.userDetailed.emojis,
                                  ),
                            ),
                            Text(
                              '${value.userDetailed.notesCount}件のツイート',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      background: SizedBox(
                        height: 190,
                        child: Stack(
                          children: [
                            if (value.userDetailed.bannerUrl != null)
                              Image.network(
                                value.userDetailed.bannerUrl!.toString(),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150,
                              )
                            else
                              SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            Positioned(
                              left: 10,
                              top: 125,
                              width: 70,
                              height: 70,
                              child: DecoratedBox(
                                position: DecorationPosition.foreground,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 6,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: AvatarIcon(
                                    avatarUrl: value.userDetailed.avatarUrl,
                                    width: 64,
                                    height: 64,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SimpleMfm(
                                value.userDetailed.name ??
                                    value.userDetailed.username,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                emojiBuilder:
                                    (context, shortCode, style) => MisskeyEmoji(
                                      shortCode: shortCode,
                                      style: style ?? const TextStyle(),
                                      isSameSize: true,
                                      remoteReactions:
                                          value.userDetailed.emojis,
                                    ),
                              ),
                              Text(
                                "@${value.userDetailed.username}${value.userDetailed.host == null ? "" : "@${value.userDetailed.host}"}",
                                style: const TextStyle(color: unDetailedColor),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Mfm(
                                mfmText: value.userDetailed.description ?? '',
                                emojiBuilder:
                                    (context, shortCode, style) => MisskeyEmoji(
                                      shortCode: shortCode,
                                      style: style ?? const TextStyle(),
                                      remoteReactions:
                                          value.userDetailed.emojis,
                                    ),
                              ),
                              if (value.userDetailed.location != null) ...[
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: unDetailedColor,
                                      size:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodySmall!.fontSize,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Text(
                                      value.userDetailed.location!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: unDetailedColor),
                                    ),
                                  ],
                                ),
                              ],
                              if (value.userDetailed.birthday != null) ...[
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cakeCandles,
                                      color: unDetailedColor,
                                      size:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodySmall!.fontSize,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Text(
                                      DateFormat(
                                        '誕生日   yyyy/MM/dd',
                                      ).format(value.userDetailed.birthday!),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: unDetailedColor),
                                    ),
                                  ],
                                ),
                              ],
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule_outlined,
                                    color: unDetailedColor,
                                    size:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.fontSize,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    "${DateFormat("yyyy年MM月").format(value.userDetailed.createdAt)}から${value.userDetailed.instance?.name ?? ref.read(accountNotifierProvider).requireValue!.meta.name}を利用しています",
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: unDetailedColor),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Mfm(
                                mfmText:
                                    '<b>\$[fg.color=000 ${value.userDetailed.followingCount}]</b> フォロー中   <b>\$[fg.color=000 ${value.userDetailed.followersCount}]</b> フォロワー',
                                style: const TextStyle(color: unDetailedColor),
                              ),
                            ],
                          ),
                        ),
                        const TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(text: 'ツイート'),
                            Tab(text: '返信'),
                            Tab(text: 'ハイライト'),
                            Tab(text: 'メディア'),
                            Tab(text: 'お気に入り'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
            body: TabBarView(
              children: [
                UserTweets(userName: userName, host: host),
                UserReplyTweets(userName: userName, host: host),
                UserHighlightNotes(userName: userName, host: host),
                UserMediaNotes(userName: userName, host: host),
                UserReactedNotes(userName: userName, host: host),
              ],
            ),
          ),
        ),
      ),
    };
  }
}

class UserTweets extends ConsumerWidget {
  const UserTweets({required this.userName, required this.host, super.key});
  final String userName;
  final String? host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basic = ref.watch(userBasicNotifierProvider(host, userName));

    return switch (basic) {
      AsyncData(:final value) => UsersTweetsDetail(
        host: host,
        userName: userName,
        state: value,
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class UsersTweetsDetail extends HookConsumerWidget {
  const UsersTweetsDetail({
    required this.state,
    required this.userName,
    super.key,
    this.host,
  });
  final String? host;
  final String userName;
  final UserBasicState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinnedNotes = [...?state.userDetailed.pinnedNotes];
    final targetNotes = [
      ...?state.userDetailed.pinnedNotes,
      ...state.latestNotes,
    ];

    final load = ref.watch(
      userBasicNotifierProvider(host, userName).loadMoreNotes,
    );

    useEffect(() {
      if (load.state is! PendingMutation) return null;
      load.call();
      return null;
    }, const []);

    return ContinueListView(
      itemCount: targetNotes.length,
      itemBuilder:
          (context, index) =>
              index >= pinnedNotes.length
                  ? MisskeyNote(note: targetNotes[index])
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 30)),
                          FaIcon(
                            FontAwesomeIcons.thumbtack,
                            color: unDetailedColor,
                            size:
                                Theme.of(
                                  context,
                                ).textTheme.bodySmall!.fontSize ??
                                22,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Text(
                            '固定',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(
                              color: unDetailedColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      MisskeyNote(note: targetNotes[index]),
                    ],
                  ),
      separatorBuilder: (context, index) => const Divider(color: lightBorder),
      onLast: () => load.state is PendingMutation ? null : load.call(),
    );
  }
}

class UserReplyTweets extends HookConsumerWidget {
  const UserReplyTweets({
    required this.userName,
    required this.host,
    super.key,
  });
  final String userName;
  final String? host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(userReplyNotifierProvider(host, userName));
    final load = ref.watch(
      userReplyNotifierProvider(host, userName).loadMoreReplyNotes,
    );

    return switch (notes) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => const Center(child: Text('エラー')),
      AsyncData(:final value) => ContinueListView(
        itemCount: value.length,
        itemBuilder: (context, index) => MisskeyNote(note: value[index]),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => load.state is PendingMutation ? null : load.call(),
      ),
    };
  }
}

class UserHighlightNotes extends HookConsumerWidget {
  const UserHighlightNotes({
    required this.userName,
    required this.host,
    super.key,
  });
  final String userName;
  final String? host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(userHighlightNotifierProvider(host, userName));
    final load = ref.watch(
      userHighlightNotifierProvider(host, userName).loadMoreHighlightNotes,
    );

    return switch (notes) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => const Center(child: Text('エラー')),
      AsyncData(:final value) => ContinueListView(
        itemCount: value.length,
        itemBuilder: (context, index) => MisskeyNote(note: value[index]),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => load.state is PendingMutation ? null : load.call(),
      ),
    };
  }
}

class UserMediaNotes extends HookConsumerWidget {
  const UserMediaNotes({required this.userName, required this.host, super.key});
  final String userName;
  final String? host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(userMediaNotifierProvider(host, userName));
    final load = ref.watch(
      userMediaNotifierProvider(host, userName).loadMoreMediaNotes,
    );

    return switch (notes) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => const Center(child: Text('エラー')),
      AsyncData(:final value) => ContinueListView(
        itemCount: value.length,
        itemBuilder: (context, index) => MisskeyNote(note: value[index]),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => load.state is PendingMutation ? null : load.call(),
      ),
    };
  }
}

class UserReactedNotes extends HookConsumerWidget {
  const UserReactedNotes({
    required this.userName,
    required this.host,
    super.key,
  });
  final String userName;
  final String? host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(userReactedNotifierProvider(host, userName));
    final load = ref.watch(
      userReactedNotifierProvider(host, userName).loadReactedNotes,
    );

    return switch (notes) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => const Center(child: Text('エラー')),
      AsyncData(:final value) => ContinueListView(
        itemCount: value.length,
        itemBuilder: (context, index) => MisskeyNote(note: value[index]),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => load.state is PendingMutation ? null : load.call(),
      ),
    };
  }
}
