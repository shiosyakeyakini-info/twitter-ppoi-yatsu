// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    APIKeyInputRoute.name: (routeData) {
      final args = routeData.argsAs<APIKeyInputRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: APIKeyInputPage(
          key: args.key,
          host: args.host,
        ),
      );
    },
    CreateNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateNotePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SearchNoteDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchNoteDetailPage(),
      );
    },
    SearchNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchNotePage(),
      );
    },
    ServerInputRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServerInputPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TimelineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimelinePage(),
      );
    },
    UserRoute.name: (routeData) {
      final args = routeData.argsAs<UserRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserPage(
          key: args.key,
          userName: args.userName,
          host: args.host,
        ),
      );
    },
  };
}

/// generated route for
/// [APIKeyInputPage]
class APIKeyInputRoute extends PageRouteInfo<APIKeyInputRouteArgs> {
  APIKeyInputRoute({
    Key? key,
    required String host,
    List<PageRouteInfo>? children,
  }) : super(
          APIKeyInputRoute.name,
          args: APIKeyInputRouteArgs(
            key: key,
            host: host,
          ),
          initialChildren: children,
        );

  static const String name = 'APIKeyInputRoute';

  static const PageInfo<APIKeyInputRouteArgs> page =
      PageInfo<APIKeyInputRouteArgs>(name);
}

class APIKeyInputRouteArgs {
  const APIKeyInputRouteArgs({
    this.key,
    required this.host,
  });

  final Key? key;

  final String host;

  @override
  String toString() {
    return 'APIKeyInputRouteArgs{key: $key, host: $host}';
  }
}

/// generated route for
/// [CreateNotePage]
class CreateNoteRoute extends PageRouteInfo<void> {
  const CreateNoteRoute({List<PageRouteInfo>? children})
      : super(
          CreateNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchNoteDetailPage]
class SearchNoteDetailRoute extends PageRouteInfo<void> {
  const SearchNoteDetailRoute({List<PageRouteInfo>? children})
      : super(
          SearchNoteDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNoteDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchNotePage]
class SearchNoteRoute extends PageRouteInfo<void> {
  const SearchNoteRoute({List<PageRouteInfo>? children})
      : super(
          SearchNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServerInputPage]
class ServerInputRoute extends PageRouteInfo<void> {
  const ServerInputRoute({List<PageRouteInfo>? children})
      : super(
          ServerInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServerInputRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TimelinePage]
class TimelineRoute extends PageRouteInfo<void> {
  const TimelineRoute({List<PageRouteInfo>? children})
      : super(
          TimelineRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimelineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<UserRouteArgs> {
  UserRoute({
    Key? key,
    required String userName,
    required String? host,
    List<PageRouteInfo>? children,
  }) : super(
          UserRoute.name,
          args: UserRouteArgs(
            key: key,
            userName: userName,
            host: host,
          ),
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<UserRouteArgs> page = PageInfo<UserRouteArgs>(name);
}

class UserRouteArgs {
  const UserRouteArgs({
    this.key,
    required this.userName,
    required this.host,
  });

  final Key? key;

  final String userName;

  final String? host;

  @override
  String toString() {
    return 'UserRouteArgs{key: $key, userName: $userName, host: $host}';
  }
}
