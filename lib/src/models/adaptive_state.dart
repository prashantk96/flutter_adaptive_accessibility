class AdaptiveState {
  final bool isAccessibilityMode;

  final double deviceScale;

  final double effectiveScale;

  const AdaptiveState({
    required this.isAccessibilityMode,
    required this.deviceScale,
    required this.effectiveScale,
  });
}
