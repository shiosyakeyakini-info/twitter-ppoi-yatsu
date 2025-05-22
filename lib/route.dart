import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tweekey/features/create_note/widgets/create_note_page.dart';
import 'package:tweekey/features/introduction/widgets/api_key_input_page.dart';
import 'package:tweekey/features/introduction/widgets/login_page.dart';
import 'package:tweekey/features/introduction/widgets/server_input_page.dart';
import 'package:tweekey/features/launch/widgets/splash_page.dart';
import 'package:tweekey/features/search_note/widgets/search_note_detail_page.dart';
import 'package:tweekey/features/search_note/widgets/search_note_page.dart';
import 'package:tweekey/features/show_user/widgets/user_page.dart';
import 'package:tweekey/features/timeline/widgets/timeline_page.dart';

part 'route.g.dart';
part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: ServerInputRoute.page),
    AutoRoute(page: APIKeyInputRoute.page),
    AutoRoute(page: TimelineRoute.page),
    AutoRoute(page: UserRoute.page),
    AutoRoute(page: CreateNoteRoute.page),
    AutoRoute(page: SearchNoteRoute.page),
    AutoRoute(page: SearchNoteDetailRoute.page),
  ];
}

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref ref) => AppRouter();
