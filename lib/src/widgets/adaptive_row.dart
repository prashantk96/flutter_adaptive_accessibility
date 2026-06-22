import 'package:flutter/material.dart';

/// A Row that automatically converts to a Column
/// when available width becomes smaller than [breakpoint].
///
/// Example:
///
/// ```dart
/// AdaptiveRow(
///   breakpoint: 500,
///   children: [
///     ImageWidget(),
///     DetailsWidget(),
///     ActionWidget(),
///   ],
/// )
/// ```
///
/// Desktop:
///
/// [Image] [Details] [Action]
///
/// Mobile:
///
/// [Image]
/// [Details]
/// [Action]
class AdaptiveRow extends StatelessWidget {
  /// Width at which Row becomes Column.
  final double breakpoint;

  /// Space between children.
  final double spacing;

  /// Child widgets.
  final List<Widget> children;

  /// Alignment when displayed as Row.
  final MainAxisAlignment mainAxisAlignment;

  /// Cross alignment when displayed as Row.
  final CrossAxisAlignment crossAxisAlignment;

  const AdaptiveRow({
    super.key,
    required this.children,
    this.breakpoint = 500,
    this.spacing = 8,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isCompact = constraints.maxWidth < breakpoint;

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _addSpacing(children, SizedBox(height: spacing)),
          );
        }

        return Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: _addSpacing(children, SizedBox(width: spacing)),
        );
      },
    );
  }

  List<Widget> _addSpacing(List<Widget> widgets, Widget spacer) {
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
