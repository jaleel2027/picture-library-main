import 'package:flutter/material.dart';

import 'color_utilities.dart';

/// THIS ENUM IS USED TO MANAGE FONT_WEIGHT...
enum FWT {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

/// THIS CLASS IS USED TO MANAGE FONT_STYLES USED IN THE APPLICATION...
class FontStyleUtilities {
  /// THIS FUINCTION RETURNS FONT_WEIGHT ACCORDING TO USER REQUIREMENT(FROM ENUM)...
  static FontWeight getFontWeight({FWT fontWeight = FWT.regular}) {
    switch (fontWeight) {
      case FWT.bold:
        return FontWeight.w700;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.light:
        return FontWeight.w300;
      default:
        return FontWeight.w400;
    }
  }

  /// FONTSTYLE FOR FONT SIZE 8
  static TextStyle h8({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 8,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 10
  static TextStyle h10({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 10,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle h12({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 12,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle h14({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 14,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 16
  static TextStyle h16({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 16,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 18
  static TextStyle h18({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 18,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 20
  static TextStyle h20({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 20,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 22
  static TextStyle h22({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 22,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 24
  static TextStyle h24({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 24,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 44
  static TextStyle h44({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 44,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 50
  static TextStyle h50({
    @required Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null ? null : fontColor ?? ColorUtilities.blackColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 50,
    );
  }
}
