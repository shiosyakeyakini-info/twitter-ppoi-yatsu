import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {
  final Uri avatarUrl;
  final double width;
  final double height;

  const AvatarIcon({
    super.key,
    required this.avatarUrl,
    this.width = 48,
    this.height = 48,
  });

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
