import 'package:flutter/material.dart';

/// Responsive Grid widget.
///
/// Automatically changes column count based
/// on available screen width.
///
/// Example:
///
/// ```dart
/// AdaptiveGrid(
///   children: products.map(ProductCard.new).toList(),
/// )
/// ```
///
/// Mobile  -> 1 Column
/// Tablet  -> 2 Columns
/// Desktop -> 4 Columns
class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;

  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;

  final double spacing;
  final double runSpacing;

  final double childAspectRatio;

  const AdaptiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 4,
    this.spacing = 12,
    this.runSpacing = 12,
    this.childAspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth;

        int columns;

        if (width >= 1200) {
          columns = desktopColumns;
        } else if (width >= 600) {
          columns = tabletColumns;
        } else {
          columns = mobileColumns;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: children.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: runSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (_, index) => children[index],
        );
      },
    );
  }
}
