import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfm/mfm.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/route.dart';

class CommonDrawer extends ConsumerWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref
        .watch(accountNotifierProvider.select((value) => value.requireValue))!;
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => context.pushRoute(UserRoute(
                      userName: account.i.username, host: account.i.host,),),
                  child: AvatarIcon(avatarUrl: account.i.avatarUrl),),
              const Padding(padding: EdgeInsets.only(top: 15)),
              SimpleMfm(
                account.i.name ?? account.i.username,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '@${account.i.username}',
                style: const TextStyle(color: unDetailedColor),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Mfm(
                mfmText:
                    '<b>\$[fg.color=000 ${account.i.followingCount}]</b> フォロー <b>\$[fg.color=000 ${account.i.followersCount}]</b> フォロワー',
                style: const TextStyle(color: unDetailedColor),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
