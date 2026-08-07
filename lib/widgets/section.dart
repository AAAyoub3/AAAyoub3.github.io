import 'package:flutter/material.dart';

import '../core/constants/app_sizes.dart';
import '../core/utils/responsive.dart';

class Section extends StatelessWidget {
  final Widget child;

  const Section({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.horizontalPadding(context);
    final verticalPadding = Responsive.sectionVerticalPadding(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: child,
      ),
    );
  }
}
