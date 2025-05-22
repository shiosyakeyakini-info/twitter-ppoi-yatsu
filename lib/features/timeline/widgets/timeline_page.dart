import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/businesses/account.dart';
import 'package:tweekey/common/app_bar.dart';
import 'package:tweekey/common/avatar_icon.dart';
import 'package:tweekey/common/common_bottom_navigation_bar.dart';
import 'package:tweekey/common/common_drawer.dart';
import 'package:tweekey/features/timeline/timeline.dart';
import 'package:tweekey/features/timeline/widgets/timeline_content.dart';
import 'package:tweekey/route.dart';

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
            toolbarHeight: 40,
            title: const AppBarIcon(),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8),
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
                  onPressed: () {}, icon: const Icon(Icons.settings_outlined),),
            ],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Tab(text: 'ローカル'),
                Tab(text: 'ホーム'),
                Tab(text: 'ソーシャル'),
                Tab(text: 'グローバル'),
              ],
            ),
          ),
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
        onPressed: () => context.pushRoute(const CreateNoteRoute()),
        child: const Icon(Icons.add),
      ),
      drawer: const CommonDrawer(),
      bottomNavigationBar: CommonBottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 1:
              context.replaceRoute(const SearchNoteRoute());
          }
        },
      ),
    );
  }
}
