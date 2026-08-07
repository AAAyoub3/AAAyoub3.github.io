import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/app_strings.dart';
import '../core/utils/launch_utils.dart';
import '../widgets/custom_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/section.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Widget buildItem(
    FaIconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: CircleAvatar(child: FaIcon(icon, size: 20, color: Colors.white)),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "CONTACT",
            subtitle: "Let's Build Something Amazing",
          ),

          const SizedBox(height: 60),

          GlassCard(
            child: Column(
              children: [
                const Text(
                  "I'm currently open to internships, freelance opportunities, and full-time Flutter developer positions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, height: 1.8),
                ),

                const SizedBox(height: 40),

                buildItem(
                  FontAwesomeIcons.envelope,
                  "Email",
                  AppStrings.email,
                  () {
                    LaunchUtils.sendMail(AppStrings.email);
                  },
                ),

                buildItem(
                  FontAwesomeIcons.linkedin,
                  "LinkedIn",
                  AppStrings.linkedin,
                  () {
                    LaunchUtils.openUrl(AppStrings.linkedin);
                  },
                ),

                buildItem(
                  FontAwesomeIcons.github,
                  "GitHub",
                  AppStrings.github,
                  () {
                    LaunchUtils.openUrl(AppStrings.github);
                  },
                ),

                buildItem(
                  FontAwesomeIcons.phone,
                  "Phone",
                  AppStrings.phone,
                  () {
                    LaunchUtils.callPhone(AppStrings.phone);
                  },
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: "Send Email",
                  icon: Icons.send,
                  onPressed: () {
                    LaunchUtils.sendMail(AppStrings.email);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
