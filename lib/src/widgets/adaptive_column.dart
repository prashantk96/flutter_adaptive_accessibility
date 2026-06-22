import 'package:flutter/material.dart';

/// Opposite of AdaptiveRow.
///
/// Starts as Column and converts to Row
/// when width exceeds breakpoint.
///
/// Useful for:
///
/// Login screens
/// Profile screens
/// Forms
class AdaptiveColumn extends StatelessWidget {
  final List<Widget> children;

  final double breakpoint;

  final double spacing;

  const AdaptiveColumn({
    super.key,
    required this.children,
    this.breakpoint = 700,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return Row(children: _spacing(children, SizedBox(width: spacing)));
        }

        return Column(children: _spacing(children, SizedBox(height: spacing)));
      },
    );
  }

  List<Widget> _spacing(List<Widget> widgets, Widget spacer) {
    final result = <Widget>[];

    for (int i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);

      if (i != widgets.length - 1) {
        result.add(spacer);
      }
    }

    return result;
  }
}
