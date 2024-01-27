import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarIcon(),
        leading: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "「いま」起きていることを見つけよう。",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.pushRoute(const ServerInputRoute()),
                    child: const Text("ログイン"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
