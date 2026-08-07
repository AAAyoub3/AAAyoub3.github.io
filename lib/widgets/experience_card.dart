import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/experience.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
            if (!isMobile)
              Container(width: 2, height: 180, color: AppColors.border),
          ],
        ),
        SizedBox(width: isMobile ? 16 : 24),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(isMobile ? 18 : 24),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.role,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  experience.company,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: isMobile ? 15 : 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  experience.duration,
                  style: const TextStyle(color: AppColors.primary),
                ),
                const SizedBox(height: 16),
                Text(
                  experience.description,
                  style: TextStyle(height: 1.7, fontSize: isMobile ? 15 : 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
