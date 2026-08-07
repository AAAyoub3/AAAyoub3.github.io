import 'dart:math';

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../widgets/project_card.dart';
import '../widgets/section.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final PageController controller = PageController();

  int currentPage = 0;

  // 2 projects per page
  static const int itemsPerPage = 2;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (final project in PortfolioData.projects) {
      precacheImage(AssetImage(project.image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = <List>[
      for (int i = 0; i < PortfolioData.projects.length; i += itemsPerPage)
        PortfolioData.projects.sublist(
          i,
          min(i + itemsPerPage, PortfolioData.projects.length),
        ),
    ];

    return Section(
      child: Column(
        children: [
          // ==========================================================
          // Header
          // ==========================================================
          SectionTitle(title: "PROJECTS", subtitle: "Featured Projects"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Previous button
              IconButton(
                onPressed: currentPage == 0
                    ? null
                    : () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                        );
                      },
                icon: const Icon(Icons.arrow_back_ios),
              ),

              // Page indicator
              Text(
                "${currentPage + 1} / ${pages.length}",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              // Next button
              IconButton(
                onPressed: currentPage == pages.length - 1
                    ? null
                    : () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                        );
                      },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // ==========================================================
          // Projects
          // ==========================================================
          SizedBox(
            height: 700,

            child: PageView.builder(
              controller: controller,

              itemCount: pages.length,

              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },

              itemBuilder: (_, pageIndex) {
                final projects = pages[pageIndex];

                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double value = 1.0;

                    if (controller.position.haveDimensions) {
                      value = controller.page! - pageIndex;
                      value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.0);
                    }

                    return Transform.scale(
                      scale: value,
                      child: Opacity(opacity: value, child: child),
                    );
                  },

                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: projects.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25,
                          childAspectRatio: 0.78,
                        ),

                    itemBuilder: (_, index) {
                      return ProjectCard(project: projects[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
