import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tweekey/route.dart';

const primaryColor = Color.fromRGBO(29, 155, 240, 1);
const unDetailedColor = Color.fromRGBO(83, 100, 113, 1);
const lightBorder = Color.fromRGBO(239, 243, 244, 1);

void main() {
  runApp(const ProviderScope(child: Tweekey()));
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class Tweekey extends ConsumerWidget {
  const Tweekey({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

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
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: unDetailedColor.withAlpha(120)),
            ),
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(primaryColor),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.standard,
              textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData(
            style: ButtonStyle(
              visualDensity: VisualDensity.standard,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
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
            elevation: 2,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.white,
            shape: BeveledRectangleBorder(),
          ),
          useMaterial3: true,
          fontFamily:
              defaultTargetPlatform == TargetPlatform.iOS
                  ? '.SF Pro Text'
                  : null,
          fontFamilyFallback:
              defaultTargetPlatform == TargetPlatform.macOS
                  ? ['ヒラギノ角ゴシック']
                  : defaultTargetPlatform == TargetPlatform.iOS
                  ? ['Helvetica Neue', 'Hiragino Kaku Gothic Pro']
                  : null,
        ),
        routerConfig: router.config(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyScrollBehavior(),
      ),
    );
  }
}
