import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/notifiers/account.dart';
import 'package:tweekey/route.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final account = ref.watch(accountNotifierProvider);
    if (!account.isLoading) {
      if (account.value != null) {
        context.pushRoute(const TimelineRoute());
      } else {
        context.pushRoute(const LoginRoute());
      }
    }
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
