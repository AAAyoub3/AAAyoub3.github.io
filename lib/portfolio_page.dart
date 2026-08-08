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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  void handleNavTap(GlobalKey key) {
    Navigator.of(context).maybePop();
    scrollTo(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF0E1625),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: [
                    const Text(
                      'AA.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _drawerItem('Home', heroKey),
                _drawerItem('Experience', experienceKey),
                _drawerItem('Projects', projectsKey),
                _drawerItem('Skills', skillsKey),
                _drawerItem('Contact', contactKey),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            NavBar(
              onHome: () => handleNavTap(heroKey),
              onExperience: () => handleNavTap(experienceKey),
              onProjects: () => handleNavTap(projectsKey),
              onSkills: () => handleNavTap(skillsKey),
              onContact: () => handleNavTap(contactKey),
              onMenuPressed: () => scaffoldKey.currentState?.openEndDrawer(),
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
      ),
    );
  }

  Widget _drawerItem(String label, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        tileColor: const Color(0xFF152238),
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => handleNavTap(key),
      ),
    );
  }
}
