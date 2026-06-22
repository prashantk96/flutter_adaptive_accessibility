import 'package:flutter/material.dart';

/// Smart text widget.
///
/// Features:
/// ✔ Respects AdaptiveApp scale limits
/// ✔ Auto resize
/// ✔ Auto ellipsis
/// ✔ Overflow protection
///
/// Example:
///
/// ```dart
/// AdaptiveText(
///   "Very Long Product Name",
///   maxLines: 2,
/// )
/// ```
class AdaptiveText extends StatelessWidget {
  final String text;

  final TextStyle? style;

  final TextAlign? textAlign;

  final int? maxLines;

  final TextOverflow overflow;

  final bool autoResize;

  final double minFontSize;

  const AdaptiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.autoResize = true,
    this.minFontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? Theme.of(context).textTheme.bodyMedium;

    if (!autoResize) {
      return Text(
        text,
        style: effectiveStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: Text(
              text,
              style: effectiveStyle,
              textAlign: textAlign,
              maxLines: maxLines,
              overflow: overflow,
            ),
          ),
        );
      },
    );
  }
}
