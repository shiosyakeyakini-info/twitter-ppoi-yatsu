import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:tweekey/pages/create_note_page/create_note_page.dart';
import 'package:tweekey/pages/login_page/api_key_input_page.dart';
import 'package:tweekey/pages/login_page/login_page.dart';
import 'package:tweekey/pages/login_page/server_input_page.dart';
import 'package:tweekey/pages/search_note_page/search_note_detail_page.dart';
import 'package:tweekey/pages/search_note_page/search_note_page.dart';
import 'package:tweekey/pages/splash_page/splash_page.dart';
import 'package:tweekey/pages/timeline_page/timeline_page.dart';
import 'package:tweekey/pages/user_page/user_page.dart';
part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
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
