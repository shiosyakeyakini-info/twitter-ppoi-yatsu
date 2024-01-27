import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfm/mfm.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/main.dart';
import 'package:tweekey/notifiers/account.dart';
import 'package:tweekey/notifiers/timeline.dart';
import 'package:tweekey/pages/timeline_page/timeline_content.dart';

@RoutePage()
class TimelinePage extends ConsumerStatefulWidget {
  const TimelinePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TimelinePageState();
}

class TimelinePageState extends ConsumerState<TimelinePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final account = ref
        .watch(accountNotifierProvider.select((value) => value.requireValue))!;

    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true,
            floating: true,
            expandedHeight: 50,
            title: const AppBarIcon(),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: AvatarIcon(
                  avatarUrl: account.i.avatarUrl,
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.settings_outlined))
            ],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Tab(text: "ローカル"),
                Tab(text: "ホーム"),
                Tab(text: "ソーシャル"),
                Tab(text: "グローバル")
              ],
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            TimelineContent(type: TimelineType.localTimeline),
            TimelineContent(type: TimelineType.homeTimeline),
            TimelineContent(type: TimelineType.socialTimeline),
            TimelineContent(type: TimelineType.globalTimeline),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarIcon(avatarUrl: account.i.avatarUrl),
                const Padding(padding: EdgeInsets.only(top: 15)),
                SimpleMfm(
                  account.i.name ?? account.i.username,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "@${account.i.username}",
                  style: const TextStyle(color: unDetailedColor),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Mfm(
                  mfmText:
                      "<b>\$[fg.color=000 ${account.i.followersCount}]</b> フォロー <b>\$[fg.color=000 ${account.i.followersCount}]</b> フォロワー",
                  style: const TextStyle(color: unDetailedColor),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: '')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
