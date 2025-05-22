import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(accountNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData(:final value):
          if (value == null) {
            context.replaceRoute(const LoginRoute());
          } else {
            context.replaceRoute(const TimelineRoute());
          }
        default:
      }
    });

    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
