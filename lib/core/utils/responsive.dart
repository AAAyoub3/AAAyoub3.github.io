import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double horizontalPadding(BuildContext context) {
    if (isMobile(context)) return 18;
    if (isTablet(context)) return 24;
    return 32;
  }

  static double sectionVerticalPadding(BuildContext context) {
    if (isMobile(context)) return 72;
    if (isTablet(context)) return 90;
    return 100;
  }

  static double heroTitleSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return 34;
    if (width < 600) return 40;
    if (width < 900) return 48;
    return 58;
  }

  static double heroSubtitleSize(BuildContext context) {
    if (isMobile(context)) return 22;
    if (isTablet(context)) return 24;
    return 28;
  }

  static double heroDescriptionSize(BuildContext context) {
    if (isMobile(context)) return 17;
    if (isTablet(context)) return 18;
    return 20;
  }

  static double sectionTitleSize(BuildContext context) {
    if (isMobile(context)) return 28;
    if (isTablet(context)) return 34;
    return 42;
  }
}
