import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  static const double designWidth = 430;

  static const double fontXs = 11;
  static const double fontSm = 14;
  static const double fontMd = 16;
  static const double fontXl = 24;
  static const double fontTitle = 36;

  static const double radiusMd = 16;
  static const double radiusLg = 20;
  static const double radiusXl = 24;
  static const double radiusFull = 1000;

  static const double inputHeight = 52;
  static const double buttonHeight = 56;

  static const double borderWidth = 1;
  static const double borderWidthThick = 2;

  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconXs = 16;

  static const double inputPadding = 14;

  static const double languagePillHeight = 36;
  static const double languagePillWidth = 116;
  static const double languagePillPaddingLeft = 20;
  static const double languagePillTop = 70;
  static const double loginFooterRowHeight = 42;

  static const double successContentHeight = 650;
  static const double confettiWidth = 120;

  static const double gradientEnd = 0.27;
  static const double titleTopFraction = 0.15;
  static const double illustrationHeightFraction = 0.25;
  static const double ringSize = 600;
  static const double ringWidth = 4;
  static const double ringOneTop = -80;
  static const double ringOneRight = 100;
  static const double ringTwoTop = 40;
  static const double ringTwoRight = -430;

  static double scale(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return (width / designWidth).clamp(0.85, 1.15).toDouble();
  }

  static double font(BuildContext context, double size) {
    return size * scale(context);
  }
}
