import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 18,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 16 : 24),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: Responsive.sectionTitleSize(context),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
