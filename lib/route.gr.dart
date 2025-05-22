// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [APIKeyInputPage]
class APIKeyInputRoute extends PageRouteInfo<void> {
  const APIKeyInputRoute({List<PageRouteInfo>? children})
    : super(APIKeyInputRoute.name, initialChildren: children);

  static const String name = 'APIKeyInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const APIKeyInputPage();
    },
  );
}

/// generated route for
/// [CreateNotePage]
class CreateNoteRoute extends PageRouteInfo<void> {
  const CreateNoteRoute({List<PageRouteInfo>? children})
    : super(CreateNoteRoute.name, initialChildren: children);

  static const String name = 'CreateNoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateNotePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [SearchNoteDetailPage]
class SearchNoteDetailRoute extends PageRouteInfo<void> {
  const SearchNoteDetailRoute({List<PageRouteInfo>? children})
    : super(SearchNoteDetailRoute.name, initialChildren: children);

  static const String name = 'SearchNoteDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchNoteDetailPage();
    },
  );
}

/// generated route for
/// [SearchNotePage]
class SearchNoteRoute extends PageRouteInfo<void> {
  const SearchNoteRoute({List<PageRouteInfo>? children})
    : super(SearchNoteRoute.name, initialChildren: children);

  static const String name = 'SearchNoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchNotePage();
    },
  );
}

/// generated route for
/// [ServerInputPage]
class ServerInputRoute extends PageRouteInfo<void> {
  const ServerInputRoute({List<PageRouteInfo>? children})
    : super(ServerInputRoute.name, initialChildren: children);

  static const String name = 'ServerInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServerInputPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [TimelinePage]
class TimelineRoute extends PageRouteInfo<void> {
  const TimelineRoute({List<PageRouteInfo>? children})
    : super(TimelineRoute.name, initialChildren: children);

  static const String name = 'TimelineRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TimelinePage();
    },
  );
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<UserRouteArgs> {
  UserRoute({
    required String userName,
    required String? host,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         UserRoute.name,
         args: UserRouteArgs(userName: userName, host: host, key: key),
         initialChildren: children,
       );

  static const String name = 'UserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserRouteArgs>();
      return UserPage(userName: args.userName, host: args.host, key: args.key);
    },
  );
}

class UserRouteArgs {
  const UserRouteArgs({required this.userName, required this.host, this.key});

  final String userName;

  final String? host;

  final Key? key;

  @override
  String toString() {
    return 'UserRouteArgs{userName: $userName, host: $host, key: $key}';
  }
}
