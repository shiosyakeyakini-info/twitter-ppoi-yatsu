import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/icon.png'),
      height: 42,
    );
  }
}
