import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/launch_utils.dart';
import 'package:portfolio/widgets/social_button.dart';
import '../core/constants/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_row.dart';
import '../widgets/section.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: ResponsiveRow(
        left: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text("👋 Hello, I'm"),
            ),

            const SizedBox(height: 30),

            const Text(
              AppStrings.name,
              style: TextStyle(
                fontSize: 58,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              AppStrings.title,
              style: TextStyle(
                fontSize: 28,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              AppStrings.shortDescription,
              style: TextStyle(fontSize: 20, height: 1.8),
            ),

            const SizedBox(height: 45),

            Row(
              children: [
                CustomButton(
                  text: "Download CV",
                  icon: Icons.download,
                  onPressed: downloadCv,
                ),

                const SizedBox(width: 20),

                const SizedBox(width: 24),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        LaunchUtils.openUrl(AppStrings.github);
                      },
                    ),

                    const SizedBox(width: 12),

                    SocialButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        LaunchUtils.openUrl(AppStrings.linkedin);
                      },
                    ),

                    const SizedBox(width: 12),

                    SocialButton(
                      icon: const Icon(
                        Icons.email_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        LaunchUtils.sendMail(AppStrings.email);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        right: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(.15),
                ),
              ),

              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/profile-1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadCv() {
    html.AnchorElement(href: 'assets/resume/Abdelrahman_Ayoub_CV.pdf')
      ..setAttribute('download', 'Abdelrahman_Ayoub_CV.pdf')
      ..click();
  }
}
