import 'package:flutter/material.dart';

class AdaptiveLayoutSwitcher extends StatelessWidget {
  final List<Widget> children;

  final double breakpoint;

  final double spacing;

  const AdaptiveLayoutSwitcher({
    super.key,
    required this.children,
    this.breakpoint = 500,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final compact = constraints.maxWidth < breakpoint;

        if (compact) {
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

        return Row(
          children: children
              .map(
                (e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing / 2),
                    child: e,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
