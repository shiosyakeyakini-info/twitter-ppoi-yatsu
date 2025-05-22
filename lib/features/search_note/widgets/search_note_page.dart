import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mfm/mfm.dart';
import 'package:misskey_dart/misskey_dart.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/common/common_bottom_navigation_bar.dart';
import 'package:tweekey/common/common_drawer.dart';
import 'package:tweekey/common/continue_list_view.dart';
import 'package:tweekey/common/misskey_emoji.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/features/search_note/search_note_page_notifier.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class SearchNotePage extends ConsumerWidget {
  const SearchNotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(
      accountNotifierProvider.select((value) => value.requireValue!.i),
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: AvatarIcon(avatarUrl: account.avatarUrl),
          ),
          toolbarHeight: 40,
          title: TextField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Color.fromRGBO(239, 243, 244, 1),
              hintText: '検索',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (text) {
              ref.read(searchQueryProvider.notifier).state = text;
              context.pushRoute(const SearchNoteDetailRoute());
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
          bottom: const TabBar(tabs: [Tab(text: 'おすすめ'), Tab(text: 'ユーザー')]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushRoute(const CreateNoteRoute()),
          child: const Icon(Icons.add),
        ),
        drawer: const CommonDrawer(),
        bottomNavigationBar: CommonBottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                context.replaceRoute(const TimelineRoute());
            }
          },
          currentIndex: 1,
        ),
        body: const TabBarView(children: [FeaturedNotes(), PinnedUser()]),
      ),
    );
  }
}

class FeaturedNotes extends ConsumerWidget {
  const FeaturedNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(
      featuredNotesProvider.select((notifier) => notifier.value?.notes ?? []),
    );

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(color: lightBorder),
      onLast: () {
        ref.read(featuredNotesProvider.notifier).loadFeaturedNotes();
      },
    );
  }
}

class PinnedUser extends ConsumerWidget {
  const PinnedUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(pinnedUserProvider);

    return switch (users) {
      AsyncLoading() => const SizedBox.shrink(),
      AsyncError() => const SizedBox.shrink(),
      AsyncData(:final value) => Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: value.length,
          itemBuilder:
              (context, index) => GestureDetector(
                onTap:
                    () => context.pushRoute(
                      UserRoute(
                        userName: value[index].username,
                        host: value[index].host,
                      ),
                    ),
                child: UserDetail(user: value[index]),
              ),
        ),
      ),
    };
  }
}

class UserDetail extends StatelessWidget {
  const UserDetail({required this.user, super.key});
  final UserDetailed user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvatarIcon(avatarUrl: user.avatarUrl),
        const Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleMfm(
                          user.name ?? user.username,
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                            const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          emojiBuilder:
                              (context, shortCode, style) => MisskeyEmoji(
                                shortCode: shortCode,
                                style: style ?? const TextStyle(),
                                isSameSize: true,
                                remoteReactions: user.emojis,
                              ),
                        ),
                        Text(
                          "@${user.username}${user.host == null ? "" : "@${user.host}"}",
                          style: const TextStyle(color: unDetailedColor),
                        ),
                      ],
                    ),
                  ),
                  if (user is UserDetailedNotMeWithRelations)
                    if ((user as UserDetailedNotMeWithRelations).isFollowing)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                                left: 10,
                                right: 10,
                              ),
                            ),
                            minimumSize: WidgetStatePropertyAll(Size.zero),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
                          ),
                          child: const Text('フォロー中'),
                        ),
                      )
                    else
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                                left: 10,
                                right: 10,
                              ),
                            ),
                            minimumSize: WidgetStatePropertyAll(Size.zero),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
                          ),
                          child: const Text('フォローする'),
                        ),
                      ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Mfm(
                mfmText: user.description ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                emojiBuilder:
                    (context, shortCode, style) => MisskeyEmoji(
                      shortCode: shortCode,
                      style: style ?? const TextStyle(),
                      isSameSize: true,
                      remoteReactions: user.emojis,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
