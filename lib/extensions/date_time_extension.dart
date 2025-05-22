import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String get positionalTimeString {
    final differ = DateTime.now().difference(this);

    if (differ < const Duration(minutes: 1)) {
      return '${differ.inSeconds}秒前';
    }
    if (differ < const Duration(hours: 1)) {
      return '${differ.inMinutes}分前';
    }

    return '$year/$month/$day';
  }
}

extension ColorExtension on Color {
  String get hex =>
      "${red.toRadixString(16)}${green.toRadixString(16)}${blue.toRadixString(16)}";
}
