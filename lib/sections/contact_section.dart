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
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        leading: CircleAvatar(
          child: FaIcon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "CONTACT",
            subtitle: "Let's Build Something Amazing",
          ),

          SizedBox(
            height: isMobile ? 32 : 60,
          ),

          GlassCard(
            child: Column(
              children: [
                Text(
                  "I'm currently open to internships, freelance opportunities, and full-time Flutter developer positions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    height: 1.8,
                  ),
                ),

                SizedBox(
                  height: isMobile ? 24 : 40,
                ),

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

                SizedBox(
                  height: isMobile ? 20 : 30,
                ),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Send Email",
                    icon: Icons.send,
                    onPressed: () {
                      LaunchUtils.sendMail(AppStrings.email);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}