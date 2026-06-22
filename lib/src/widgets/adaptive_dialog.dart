import 'package:flutter/material.dart';

class AdaptiveDialog extends StatelessWidget {
  final Widget child;

  const AdaptiveDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final double dialogWidth = width > 800 ? 600 : width * .9;

    return Dialog(
      child: SizedBox(width: dialogWidth, child: child),
    );
  }
}
