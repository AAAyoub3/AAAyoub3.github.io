import 'package:flutter/material.dart';

import '../core/utils/responsive.dart';

class ResponsiveRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const ResponsiveRow({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          right,
          const SizedBox(height: 50),
          left,
        ],
      );
    }

    return Row(
      children: [

        Expanded(
          flex: 6,
          child: left,
        ),

        SizedBox(width: 60),

        Expanded(
          flex: 5,
          child: right,
        ),

      ],
    );
  }
}