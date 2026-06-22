import 'package:flutter/material.dart';

class AdaptiveSliverGrid extends StatelessWidget {
  final SliverChildDelegate delegate;

  const AdaptiveSliverGrid({super.key, required this.delegate});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    int columns = 1;

    if (width >= 1200) {
      columns = 4;
    } else if (width >= 600) {
      columns = 2;
    }

    return SliverGrid(
      delegate: delegate,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
