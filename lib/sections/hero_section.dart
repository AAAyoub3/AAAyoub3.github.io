import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/launch_utils.dart';
import 'package:portfolio/widgets/social_button.dart';
import '../core/constants/app_strings.dart';
import '../core/utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_row.dart';
import '../widgets/section.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Section(
      child: ResponsiveRow(
        left: Column(
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text("👋 Hello, I'm"),
            ),
            SizedBox(height: isMobile ? 20 : 30),
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: isMobile ? Alignment.center : Alignment.centerLeft,
                child: Text(
                  AppStrings.name,
                  style: TextStyle(
                    fontSize: Responsive.heroTitleSize(context) - 2,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 14 : 18),
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: isMobile ? Alignment.center : Alignment.centerLeft,
                child: Text(
                  AppStrings.title,
                  style: TextStyle(
                    fontSize: Responsive.heroSubtitleSize(context),
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                AppStrings.shortDescription,
                style: TextStyle(
                  fontSize: Responsive.heroDescriptionSize(context),
                  height: 1.8,
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
            ),
            SizedBox(height: isMobile ? 28 : 45),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
              children: [
                CustomButton(
                  text: "Download CV",
                  icon: Icons.download,
                  onPressed: () {
                    html.AnchorElement(
                        href: 'assets/assets/resume/Abdelrahman_Ayoub_CV.pdf',
                      )
                      ..setAttribute('download', 'Abdelrahman_Ayoub_CV.pdf')
                      ..click();
                  },
                ),
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
                width: isMobile ? 250 : 360,
                height: isMobile ? 250 : 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(.15),
                ),
              ),
              Container(
                width: isMobile ? 210 : 300,
                height: isMobile ? 210 : 300,
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
}
