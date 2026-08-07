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
    return Section(
      child: Column(
        children: [

          const SectionTitle(
            title: "EXPERIENCE",
            subtitle: "My Professional Journey",
          ),

          const SizedBox(height: 60),

          ListView.separated(
            itemCount: PortfolioData.experiences.length,

            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            separatorBuilder: (_, __) => const SizedBox(height: 40),

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