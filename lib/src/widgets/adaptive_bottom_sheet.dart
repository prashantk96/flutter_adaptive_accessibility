import 'package:flutter/material.dart';
import 'package:flutter_adaptive_accessibility/src/widgets/adaptive_dialog.dart';

class AdaptiveBottomSheet {
  const AdaptiveBottomSheet._();

  static Future<T?> show<T>(BuildContext context, {required Widget child}) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > 800) {
      return showDialog<T>(
        context: context,
        builder: (_) => AdaptiveDialog(child: child),
      );
    }

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (_) => child,
    );
  }
}
