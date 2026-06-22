import 'package:flutter/material.dart';

class AdaptiveList extends StatelessWidget {
  final int itemCount;

  final IndexedWidgetBuilder itemBuilder;

  const AdaptiveList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return GridView.builder(
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: itemBuilder,
      );
    }

    return ListView.builder(itemCount: itemCount, itemBuilder: itemBuilder);
  }
}
