import 'package:flutter/material.dart';

/// Adaptive Scaffold
///
/// Features:
/// ✅ Responsive padding
/// ✅ Keyboard-safe
/// ✅ SafeArea support
/// ✅ Accessibility friendly
/// ✅ Mobile / Tablet / Desktop support
class AdaptiveScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final bool useSafeArea;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    double padding;

    if (width >= 1200) {
      padding = 32;
    } else if (width >= 600) {
      padding = 24;
    } else {
      padding = 16;
    }

    Widget content = Padding(padding: EdgeInsets.all(padding), child: body);

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      body: content,
    );
  }
}
