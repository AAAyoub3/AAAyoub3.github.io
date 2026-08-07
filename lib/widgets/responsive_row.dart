import 'package:flutter/material.dart';

import '../core/utils/responsive.dart';

class ResponsiveRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const ResponsiveRow({super.key, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [left, const SizedBox(height: 40), right],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: left),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: right),
      ],
    );
  }
}
