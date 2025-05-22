import 'package:flutter/material.dart';
import 'package:tweekey/main.dart';

class CommonBottomNavigationBar extends StatelessWidget {

  const CommonBottomNavigationBar({
    super.key,
    this.onTap,
    this.currentIndex = 0,
  });
  final void Function(int index)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: unDetailedColor,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: '',),
        ],
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
