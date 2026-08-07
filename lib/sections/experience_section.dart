import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../data/portfolio_data.dart';
import '../widgets/experience_card.dart';
import '../widgets/section.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "EXPERIENCE",
            subtitle: "My Professional Journey",
          ),
          SizedBox(height: isMobile ? 32 : 60),
          ListView.separated(
            itemCount: PortfolioData.experiences.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: isMobile ? 24 : 40),
            itemBuilder: (_, index) {
              return ExperienceCard(
                experience: PortfolioData.experiences[index],
              );
            },
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms).slideY(begin: .2);
  }
}
