import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweekey/route.dart';

const primaryColor = Color.fromRGBO(29, 155, 240, 1);
const unDetailedColor = Color.fromRGBO(83, 100, 113, 1);
const lightBorder = Color.fromRGBO(239, 243, 244, 1);

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
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.standard,
              textStyle: MaterialStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData(
            style: ButtonStyle(
              visualDensity: VisualDensity.standard,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: MaterialStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          tabBarTheme: const TabBarTheme(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          visualDensity: VisualDensity.standard,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            elevation: 2.0,
          ),
          drawerTheme: const DrawerThemeData(
              backgroundColor: Colors.white, shape: BeveledRectangleBorder()),
          useMaterial3: true,
          fontFamily: defaultTargetPlatform == TargetPlatform.iOS
              ? ".SF Pro Text"
              : null,
          fontFamilyFallback: defaultTargetPlatform == TargetPlatform.macOS
              ? ["ヒラギノ角ゴシック"]
              : defaultTargetPlatform == TargetPlatform.iOS
                  ? ["Helvetica Neue", "Hiragino Kaku Gothic Pro"]
                  : null,
        ),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyScrollBehavior(),
      ),
    );
  }
}
