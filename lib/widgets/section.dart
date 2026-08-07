import 'package:flutter/material.dart';

import '../core/constants/app_sizes.dart';
import '../core/utils/responsive.dart';

class Section extends StatelessWidget {
  final Widget child;

  const Section({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 40;

    if (Responsive.isTablet(context)) {
      horizontalPadding = 28;
    }

    if (Responsive.isMobile(context)) {
      horizontalPadding = 18;
    }

    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: AppSizes.maxWidth,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 100,
        ),
        child: child,
      ),
    );
  }
}