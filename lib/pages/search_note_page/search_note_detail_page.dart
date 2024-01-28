import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/continue_list_view.dart';
import 'package:tweekey/common/misskey_note.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/notifiers/search_note_page_notifier.dart';
import 'package:tweekey/pages/search_note_page/search_note_page.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class SearchNoteDetailPage extends ConsumerStatefulWidget {
  const SearchNoteDetailPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      SearchNoteDetailPageState();
}

class SearchNoteDetailPageState extends ConsumerState<SearchNoteDetailPage> {
  late final _controller = TextEditingController(
      text: ref.read(searchNotePageNotifierProvider).searchWord);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              filled: true,
              fillColor: Color.fromRGBO(239, 243, 244, 1),
              hintText: "検索",
              prefixIcon: Icon(Icons.search),
            ),
            controller: _controller,
            onSubmitted: (text) {
              ref
                  .watch(searchNotePageNotifierProvider.notifier)
                  .updateSearchText(text);
            },
          ),
          bottom: const TabBar(tabs: [Tab(text: "最新"), Tab(text: "ユーザー")]),
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
    final notes = ref.watch(
        searchNotePageNotifierProvider.select((value) => value.latestNotes));

    if (notes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(searchNotePageNotifierProvider.notifier).loadLatestNotes();
      });
    }

    return ContinueListView(
      itemCount: notes.length,
      itemBuilder: (context, index) => MisskeyNote(note: notes[index]),
      separatorBuilder: (context, index) => const Divider(
        color: lightBorder,
      ),
      onLast: () {
        ref.watch(searchNotePageNotifierProvider.notifier).loadLatestNotes();
      },
    );
  }
}

class UserSearch extends ConsumerWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref
        .watch(searchNotePageNotifierProvider.select((value) => value.users));

    if (users.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(searchNotePageNotifierProvider.notifier).loadUsers();
      });
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ContinueListView(
        itemCount: users.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => context.pushRoute(
                  UserRoute(
                    userName: users[index].username,
                    host: users[index].host,
                  ),
                ),
            child: UserDetail(user: users[index])),
        separatorBuilder: (context, index) => const Divider(
          color: lightBorder,
        ),
        onLast: () {
          ref.watch(searchNotePageNotifierProvider.notifier).loadUsers();
        },
      ),
    );
  }
}
