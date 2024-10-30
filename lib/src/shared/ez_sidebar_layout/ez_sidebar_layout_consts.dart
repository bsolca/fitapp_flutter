import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_squircle/ez_squircle.dart';
import 'package:impostor/src/utils/constants/ez_const_layout.dart';

/// Constants and utility methods used in the EzSidebarLayout widget.
class EzSidebarLayoutConsts {
  EzSidebarLayoutConsts._();

  // ***************
  // Global Layout Constants
  // ***************

  /// Sidebar padding (vertical)
  static const EdgeInsets sidebarPadding = EzSidebarConsts.sidebarPadding;

  /// Content container margin
  static const EdgeInsets contentMargin = EdgeInsets.all(
    EzConstLayout.spacerSmall,
  );

  /// Content container border radius
  static const double contentBorderRadius = 10;

  /// Content container border smoothing
  static const double contentBorderSmoothing = 0.5;

  /// Content container border width
  static const double contentBorderWidth = 0.5;

  // ***************
  // Colors
  // ***************

  /// Returns the background color of layout based on the color scheme.
  static Color getSidebarBackgroundColor(ColorScheme colorScheme) {
    return EzConstLayout.getSecondaryBackgroundColor(colorScheme);
  }

  /// Returns the content area color based on the color scheme.
  static Color getContentColor(ColorScheme colorScheme) {
    return EzConstLayout.getBackgroundColor(colorScheme);
  }

  /// Returns the border color of the content area based on the color scheme.
  static Color getContentBorderColor(ColorScheme colorScheme) {
    return EzConstLayout.getMainBorderColor(colorScheme);
  }

  // ***************
  // Border
  // ***************

  /// Returns the shape border for the content area using SmoothRectangleBorder.
  static ShapeBorder getContentShapeBorder(ColorScheme colorScheme) {
    return SmoothRectangleBorder(
      side: BorderSide(
        color: getContentBorderColor(colorScheme),
        width: contentBorderWidth,
      ),
      borderRadius: SmoothBorderRadius(
        cornerRadius: contentBorderRadius,
        cornerSmoothing: contentBorderSmoothing,
      ),
    );
  }
}
