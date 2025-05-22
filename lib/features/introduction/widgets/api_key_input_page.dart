import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/mutation.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/features/introduction/login.dart';

@RoutePage()
class APIKeyInputPage extends HookConsumerWidget {
  const APIKeyInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginNotifierProvider.login);
    final apiKeyController = useTextEditingController();
    useEffect(() {
      void listener() => ref
          .read(loginNotifierProvider.notifier)
          .updateApiKey(apiKeyController.text);

      apiKeyController.addListener(listener);
      return () => apiKeyController.removeListener(listener);
    });

    return Scaffold(
      appBar: AppBar(title: const AppBarIcon()),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'APIキーを入力',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: apiKeyController,
                    decoration: const InputDecoration(hintText: '発行したAPIキー'),
                  ),
                  switch (login.state) {
                    ErrorMutation(:final error) => Card(
                      child: Text(error.toString()),
                    ),
                    _ => const SizedBox.shrink(),
                  },
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  ElevatedButton(
                    onPressed:
                        login.state is PendingMutation ? null : login.call,
                    child: const Text('次へ'),
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
