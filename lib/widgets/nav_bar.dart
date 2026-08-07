import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/responsive.dart';

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
    final isMobile = Responsive.isMobile(context);

    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 40),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border)),
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
          if (isMobile)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.white),
              color: AppColors.card,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onSelected: (value) {
                switch (value) {
                  case 'home':
                    onHome();
                    break;
                  case 'experience':
                    onExperience();
                    break;
                  case 'projects':
                    onProjects();
                    break;
                  case 'skills':
                    onSkills();
                    break;
                  case 'contact':
                    onContact();
                    break;
                }
              },
              itemBuilder: (context) => [
                _menuItem('Home', 'home'),
                _menuItem('Experience', 'experience'),
                _menuItem('Projects', 'projects'),
                _menuItem('Skills', 'skills'),
                _menuItem('Contact', 'contact'),
              ],
            )
          else ...[
            navButton("Home", onHome),
            navButton("Experience", onExperience),
            navButton("Projects", onProjects),
            navButton("Skills", onSkills),
            navButton("Contact", onContact),
          ],
        ],
      ),
    );
  }

  PopupMenuEntry<String> _menuItem(String label, String value) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget navButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
