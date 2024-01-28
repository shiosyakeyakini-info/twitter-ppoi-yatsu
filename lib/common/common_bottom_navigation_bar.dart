import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final void Function(int index)? onTap;
  final int currentIndex;

  const CommonBottomNavigationBar({
    super.key,
    this.onTap,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined), label: '')
      ],
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
