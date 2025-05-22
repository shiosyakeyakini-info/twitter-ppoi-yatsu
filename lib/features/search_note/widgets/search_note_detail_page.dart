import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:tweekey/common/continue_list_view.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/features/search_note/search_note_page_notifier.dart';
import 'package:tweekey/features/search_note/widgets/search_note_page.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class SearchNoteDetailPage extends ConsumerWidget {
  const SearchNoteDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
      text: ref.watch(searchQueryProvider),
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
              filled: true,
              fillColor: Color.fromRGBO(239, 243, 244, 1),
              hintText: '検索',
              prefixIcon: Icon(Icons.search),
            ),
            controller: controller,
            onSubmitted:
                (text) => ref.read(searchQueryProvider.notifier).state = text,
          ),
          bottom: const TabBar(tabs: [Tab(text: '最新'), Tab(text: 'ユーザー')]),
        ),
        body: const TabBarView(children: [NoteSearch(), UserSearch()]),
      ),
    );
  }
}

class NoteSearch extends ConsumerWidget {
  const NoteSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(featuredNotesProvider);
    final load = ref.watch(featuredNotesProvider.loadFeaturedNotes);

    return switch (notes) {
      AsyncData(:final value) => ContinueListView(
        itemCount: value.notes.length,
        itemBuilder: (context, index) => MisskeyNote(note: value.notes[index]),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => load.state is PendingMutation ? null : load.call(),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class UserSearch extends ConsumerWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(searchUsersProvider.select((value) => value.users));

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ContinueListView(
        itemCount: users.length,
        itemBuilder:
            (context, index) => GestureDetector(
              onTap:
                  () => context.pushRoute(
                    UserRoute(
                      userName: users[index].username,
                      host: users[index].host,
                    ),
                  ),
              child: UserDetail(user: users[index]),
            ),
        separatorBuilder: (context, index) => const Divider(color: lightBorder),
        onLast: () => ref.read(searchUsersProvider.notifier).loadUsers(),
      ),
    );
  }
}
