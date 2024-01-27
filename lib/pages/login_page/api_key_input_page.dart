import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/notifiers/account.dart';
import 'package:tweekey/notifiers/login.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class APIKeyInputPage extends ConsumerStatefulWidget {
  final String host;

  const APIKeyInputPage({super.key, required this.host});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => APIKeyInputPageState();
}

class APIKeyInputPageState extends ConsumerState<APIKeyInputPage> {
  final _apiKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiKeyController.addListener(() {
      ref
          .read(loginNotifierProvider.notifier)
          .updateApiKey(_apiKeyController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _apiKeyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final login = ref.watch(loginNotifierProvider);

    if (login.isLoginDone) {
      context.pushRoute(const TimelineRoute());
    }

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    "APIキーを入力",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: _apiKeyController,
                    decoration: const InputDecoration(hintText: "発行したAPIキー"),
                  ),
                  if (login.loginErrorMessage != null)
                    Card(
                      child: Text(login.loginErrorMessage!),
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
                      onPressed: () async {
                        await ref.read(loginNotifierProvider.notifier).login();
                      },
                      child: const Text("次へ"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
