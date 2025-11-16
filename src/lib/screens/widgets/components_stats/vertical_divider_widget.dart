import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatelessWidget {
  final double height;

  const VerticalDividerWidget({
    super.key,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15),
    );
  }
}
