import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/features/create_note/create_note.dart';

@RoutePage()
class CreateNotePage extends HookConsumerWidget {
  const CreateNotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteController = useTextEditingController();
    final updateNote = ref.watch(createNotePageNotifierProvider.note);

    final avatarUrl = ref.watch(
      accountNotifierProvider.select(
        (value) => value.requireValue!.i.avatarUrl,
      ),
    );

    ref.listen(createNotePageNotifierProvider.note, (_, next) {
      switch (next.state) {
        case SuccessMutation():
          context.pop();
        case ErrorMutation(:final error):
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        default:
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => context.maybePop(),
          child: const Text('キャンセル', style: TextStyle(color: Colors.black)),
        ),
        leadingWidth: 150,
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: const Text('下書き'),
          ),
          ElevatedButton(
            onPressed:
                updateNote.state is PendingMutation
                    ? null
                    : () => updateNote.call(noteController.text),
            child: const Text('ツイートする'),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AvatarIcon(avatarUrl: avatarUrl),
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        maxLines: null,
                        controller: noteController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'いまどうしてる？',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
