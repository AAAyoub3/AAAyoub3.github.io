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
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet =
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1024;

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
            children: PortfolioData.skills
                .map(
                  (skill) => SizedBox(
                    width: isMobile
                        ? (MediaQuery.of(context).size.width - 56) / 2
                        : isTablet
                        ? 180
                        : 170,
                    child: HoverCard(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 12 : 16,
                          vertical: 20,
                        ),
                        child: Center(
                          child: Text(
                            skill.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 15 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms).slideY(begin: .2);
  }
}
