import 'package:flutter/material.dart';

class EzConstsColorsGetter {
  EzConstsColorsGetter._();

  static Color getSecondaryContainerColor(ColorScheme colorScheme) {
    return colorScheme.secondaryContainer;
  }

  static Color getBorderColor(ColorScheme colorScheme) {
    return getMainBorderColor(colorScheme).withOpacity(0.95);
  }

  static Color getDividerColor(ColorScheme colorScheme) {
    return colorScheme.inverseSurface.withAlpha(20);
  }

  static Color getBackgroundColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.dark
        ? colorScheme.surface
        : colorScheme.surfaceContainer;
  }

  static Color getIndicatorColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  static Color getOverlayColor(ColorScheme colorScheme) {
    return colorScheme.inverseSurface.withAlpha(20);
  }

  static Color getHoverColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  static Color getIconDefaultColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.6);
  }

  static Color getItemSelectedColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  static Color getMainBorderColor(ColorScheme colorScheme) =>
      colorScheme.brightness == Brightness.dark
          ? colorScheme.surfaceContainer
          : colorScheme.surfaceContainer;

  static Color getSecondaryBackgroundColor(ColorScheme colorScheme) =>
      colorScheme.brightness == Brightness.dark
          ? colorScheme.surface
          : colorScheme.surfaceContainerHighest;
}
