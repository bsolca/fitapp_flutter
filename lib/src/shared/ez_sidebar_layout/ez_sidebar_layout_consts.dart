import 'package:ez_fit_app/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:ez_fit_app/src/shared/ez_squircle/ez_squircle.dart';
import 'package:ez_fit_app/src/utils/constants/ez_const_color_getter.dart';
import 'package:ez_fit_app/src/utils/constants/ez_const_layout.dart';
import 'package:flutter/material.dart';

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
    return EzConstsColorsGetter.getSecondaryBackgroundColor(colorScheme);
  }

  /// Returns the content area color based on the color scheme.
  static Color getContentColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getMainBorderColor(colorScheme);
  }

  /// Returns the border color of the content area based on the color scheme.
  static Color getContentBorderColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getMainBorderColor(colorScheme);
  }

  // ***************
  // Border
  // ***************

  /// Returns the shape border for the content area using SmoothRectangleBorder.
  static ShapeBorder getContentShapeBorder(ColorScheme colorScheme) {
    return EzSmoothRectangleBorder(
      side: BorderSide(
        color: getContentBorderColor(colorScheme),
        width: contentBorderWidth,
      ),
      borderRadius: EzSmoothBorderRadius(
        cornerRadius: contentBorderRadius,
        cornerSmoothing: contentBorderSmoothing,
      ),
    );
  }
}
