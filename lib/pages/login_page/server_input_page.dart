import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/notifiers/login.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class ServerInputPage extends ConsumerStatefulWidget {
  const ServerInputPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ServerInputPageState();
}

class ServerInputPageState extends ConsumerState<ServerInputPage> {
  final _serverController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _serverController.addListener(() {
      ref
          .read(loginNotifierProvider.notifier)
          .updateHost(_serverController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _serverController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(loginNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const AppBarIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    "始めるには、まずお使いのサーバーを入力してください。",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: _serverController,
                    decoration:
                        const InputDecoration(hintText: "サーバー名（例: misskey.io）"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(),
                  ElevatedButton(
                    onPressed: () => context.pushRoute(
                        APIKeyInputRoute(host: _serverController.text)),
                    child: const Text("次へ"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
