import 'package:flutter/material.dart';

class AdaptiveContainer extends StatelessWidget {
  final Widget child;

  final EdgeInsets? padding;

  final Color? color;

  const AdaptiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    EdgeInsets effectivePadding;

    if (padding != null) {
      effectivePadding = padding!;
    } else if (width >= 1200) {
      effectivePadding = const EdgeInsets.all(24);
    } else if (width >= 600) {
      effectivePadding = const EdgeInsets.all(16);
    } else {
      effectivePadding = const EdgeInsets.all(12);
    }

    return Container(padding: effectivePadding, color: color, child: child);
  }
}
