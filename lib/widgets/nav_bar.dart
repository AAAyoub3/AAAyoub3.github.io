import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const NavBar({
    super.key,
    required this.onHome,
    required this.onSkills,
    required this.onExperience,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text(
            "AA.",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const Spacer(),
          navButton("Home", onHome),
          navButton("Experience", onExperience),
          navButton("Projects", onProjects),
          navButton("Skills", onSkills),
          navButton("Contact", onContact),
        ],
      ),
    );
  }

  Widget navButton(
    String text,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}