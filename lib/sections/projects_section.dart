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

  static const int itemsPerPage = 2;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Preload all project images once.
    for (final project in PortfolioData.projects) {
      precacheImage(
        AssetImage(project.image),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Desktop / tablet = 2 projects per page.
    // Mobile = 1 project per page.
    final currentItemsPerPage = isMobile ? 1 : itemsPerPage;

    final pages = <List>[
      for (
        int i = 0;
        i < PortfolioData.projects.length;
        i += currentItemsPerPage
      )
        PortfolioData.projects.sublist(
          i,
          min(
            i + currentItemsPerPage,
            PortfolioData.projects.length,
          ),
        ),
    ];

    /*
     * Calculate a proper height for the PageView.
     *
     * The PageView MUST have a bounded height.
     *
     * Mobile:
     *   1 project → taller card
     *
     * Tablet/Desktop:
     *   2 projects side by side
     */
    final double projectsHeight;

    if (isMobile) {
      projectsHeight = 620;
    } else if (isTablet) {
      projectsHeight = 620;
    } else {
      projectsHeight = 650;
    }

    return Section(
      child: Column(
        children: [
          const SectionTitle(
            title: "PROJECTS",
            subtitle: "Featured Projects",
          ),

          SizedBox(
            height: isMobile ? 16 : 24,
          ),

          // --------------------------------------------------
          // Pagination Controls
          // --------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                tooltip: "Previous projects",
                onPressed: currentPage == 0
                    ? null
                    : () {
                        controller.previousPage(
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeOutCubic,
                        );
                      },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  "${currentPage + 1} / ${pages.length}",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              IconButton(
                tooltip: "Next projects",
                onPressed: currentPage == pages.length - 1
                    ? null
                    : () {
                        controller.nextPage(
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeOutCubic,
                        );
                      },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            ],
          ),

          SizedBox(
            height: isMobile ? 24 : 40,
          ),

          // --------------------------------------------------
          // IMPORTANT:
          // PageView MUST have a bounded height.
          // --------------------------------------------------
          SizedBox(
            height: projectsHeight,
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,

              onPageChanged: (index) {
                if (!mounted) return;

                setState(() {
                  currentPage = index;
                });
              },

              itemBuilder: (context, pageIndex) {
                final projects = pages[pageIndex];

                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double scale = 1.0;
                    double opacity = 1.0;

                    if (controller.hasClients &&
                        controller.position.haveDimensions) {
                      final page = controller.page;

                      if (page != null) {
                        final difference =
                            (page - pageIndex).abs();

                        scale = (1 - difference * 0.08)
                            .clamp(0.92, 1.0);

                        opacity = (1 - difference * 0.15)
                            .clamp(0.85, 1.0);
                      }
                    }

                    return Transform.scale(
                      scale: scale,
                      child: Opacity(
                        opacity: opacity,
                        child: child,
                      ),
                    );
                  },

                  child: GridView.builder(
                    // The GridView is not responsible for scrolling.
                    physics:
                        const NeverScrollableScrollPhysics(),

                    // The PageView controls the scrolling.
                    shrinkWrap: true,

                    padding: EdgeInsets.zero,

                    itemCount: projects.length,

                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,

                      crossAxisSpacing: isMobile ? 0 : 20,

                      mainAxisSpacing: 20,

                      /*
                       * Project cards should have enough
                       * vertical space to display completely.
                       */
                      childAspectRatio: isMobile
                          ? 0.78
                          : 0.78,
                    ),

                    itemBuilder: (context, index) {
                      return ProjectCard(
                        project: projects[index],
                      );
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