import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/features/introduction/login.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class ServerInputPage extends HookConsumerWidget {
  const ServerInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginNotifierProvider.notifier);

    final serverController = useTextEditingController();
    useEffect(() {
      void listener() => loginNotifier.updateHost(serverController.text);

      serverController.addListener(listener);
      return () => serverController.removeListener(listener);
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
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    '始めるには、まずお使いのサーバーを入力してください。',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: serverController,
                    decoration: const InputDecoration(
                      hintText: 'サーバー名（例: misskey.io）',
                    ),
                  ),
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
                        () => context.pushRoute(const APIKeyInputRoute()),
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
