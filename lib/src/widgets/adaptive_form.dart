import 'package:flutter/material.dart';

/// Responsive form layout.
///
/// Mobile:
///
/// Name
/// Email
/// Phone
///
/// Tablet:
///
/// Name   Email
/// Phone
class AdaptiveForm extends StatelessWidget {
  final List<Widget> children;

  final double breakpoint;

  final double spacing;

  const AdaptiveForm({
    super.key,
    required this.children,
    this.breakpoint = 700,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isMobile = constraints.maxWidth < breakpoint;

        if (isMobile) {
          return Column(
            children: children
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: spacing),
                    child: e,
                  ),
                )
                .toList(),
          );
        }

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children.map((e) {
            return SizedBox(
              width: constraints.maxWidth / 2 - spacing,
              child: e,
            );
          }).toList(),
        );
      },
    );
  }
}
