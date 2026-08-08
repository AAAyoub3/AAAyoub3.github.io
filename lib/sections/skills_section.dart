import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../data/portfolio_data.dart';
import '../widgets/hover_card.dart';
import '../widgets/section.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "TECH STACK",
            subtitle: "Technologies I Work With",
          ),

          SizedBox(height: isMobile ? 32 : 60),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: PortfolioData.skills.map((skill) {
              return SizedBox(
                // ==============================
                // MOBILE
                // ==============================
                width: isMobile
                    ? (screenWidth - 56) / 2
                    // ==============================
                    // TABLET / DESKTOP
                    // ==============================
                    : isTablet
                    ? 180
                    : 180,

                // Fixed height for website
                // so every card is identical.
                height: isMobile ? null : 120,

                child: HoverCard(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 12 : 16,
                        vertical: 20,
                      ),
                      child: Text(
                        skill.title,
                        textAlign: TextAlign.center,
                        maxLines: isMobile ? 2 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms).slideY(begin: .2);
  }
}
