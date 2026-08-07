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
    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "TECH STACK",
            subtitle: "Technologies I Work With",
          ),

          const SizedBox(height: 60),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,

            children: PortfolioData.skills
                .map(
                  (skill) => SizedBox(
                    width: 170,
                    height: 100,
                    child: HoverCard(
                      child: Center(
                        child: Text(
                          skill.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
