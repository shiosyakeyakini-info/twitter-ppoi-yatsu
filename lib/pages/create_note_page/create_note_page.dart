import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/notifiers/account.dart';
import 'package:tweekey/notifiers/create_note_page_notifier.dart';

@RoutePage()
class CreateNotePage extends ConsumerStatefulWidget {
  const CreateNotePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CreateNotePageState();
}

class CreateNotePageState extends ConsumerState<CreateNotePage> {
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteController.addListener(() {
      ref
          .read(createNotePageNotifierProvider.notifier)
          .updateNote(_noteController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = ref.watch(accountNotifierProvider
        .select((value) => value.requireValue!.i.avatarUrl));
    ref.watch(createNotePageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => context.popRoute(),
          child: const Text("キャンセル", style: TextStyle(color: Colors.black)),
        ),
        leadingWidth: 150,
        actions: [
          TextButton(
            onPressed: () => context.popRoute(),
            child: const Text("下書き"),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(createNotePageNotifierProvider.notifier).note();
                context.popRoute();
              },
              child: const Text("ツイートする")),
          const Padding(padding: EdgeInsets.only(left: 10)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AvatarIcon(
                    avatarUrl: avatarUrl,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      maxLines: null,
                      minLines: null,
                      controller: _noteController,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "いまどうしてる？",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
