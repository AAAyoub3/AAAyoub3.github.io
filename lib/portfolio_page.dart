import 'package:flutter/material.dart';
import 'package:portfolio/widgets/footer.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'widgets/nav_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController scrollController = ScrollController();

  final heroKey = GlobalKey();

  final aboutKey = GlobalKey();

  final skillsKey = GlobalKey();

  final experienceKey = GlobalKey();

  final projectsKey = GlobalKey();

  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onHome: () => scrollTo(heroKey),
            onExperience: () => scrollTo(experienceKey),
            onProjects: () => scrollTo(projectsKey),
            onSkills: () => scrollTo(skillsKey),
            onContact: () => scrollTo(contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  HeroSection(key: heroKey),
                  ExperienceSection(key: experienceKey),
                  ProjectsSection(key: projectsKey),
                  SkillsSection(key: skillsKey),
                  ContactSection(key: contactKey),
                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
