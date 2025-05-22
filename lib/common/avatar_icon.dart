import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {

  const AvatarIcon({
    required this.avatarUrl, super.key,
    this.width = 42,
    this.height = 42,
  });
  final Uri avatarUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FittedBox(
        child: Image.network(
          avatarUrl.toString(),
          width: width,
          height: height,
          errorBuilder: (context, e, s) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
