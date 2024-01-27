import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/route.dart';

const primaryColor = Color.fromRGBO(29, 155, 240, 1);
const unDetailedColor = Color.fromRGBO(83, 100, 113, 1);

void main() {
  runApp(const Tweekey());
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Tweekey extends StatefulWidget {
  const Tweekey({super.key});

  @override
  State<StatefulWidget> createState() => TweekeyState();
}

class TweekeyState extends State<Tweekey> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            primary: primaryColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: unDetailedColor.withAlpha(120)))),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            elevation: 2.0,
          ),
          drawerTheme: const DrawerThemeData(
              backgroundColor: Colors.white, shape: BeveledRectangleBorder()),
          useMaterial3: true,
          fontFamilyFallback: const ["ヒラギノ角ゴシック"],
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyScrollBehavior(),
      ),
    );
  }
}
