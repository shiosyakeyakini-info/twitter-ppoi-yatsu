import 'package:flutter/material.dart';
import 'package:tweekey/main.dart';

class RenoteModalSheet extends StatelessWidget {
  const RenoteModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.repeat_rounded),
            title: const Text('リツイート'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.edit),
            title: const Text('引用'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              'キャンセル',
              style: TextStyle(color: unDetailedColor),
            ),
          ),
        ],
      ),
    );
  }
}
