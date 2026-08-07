import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/experience.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
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

            Container(width: 2, height: 170, color: AppColors.border),
          ],
        ),

        const SizedBox(width: 30),

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(28),

            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.role,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  experience.company,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  experience.duration,
                  style: const TextStyle(color: AppColors.card),
                ),

                const SizedBox(height: 20),

                Text(
                  experience.description,
                  style: const TextStyle(height: 1.7),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
