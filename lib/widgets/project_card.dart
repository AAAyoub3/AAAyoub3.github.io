import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/launch_utils.dart';
import 'package:portfolio/widgets/social_button.dart';

import '../core/constants/app_colors.dart';
import '../models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..translate(0.0, hovering ? -8.0 : 0.0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: hovering ? AppColors.primary : AppColors.border,
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.2),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: hovering ? 1.08 : 1.0,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        widget.project.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: hovering ? 1.0 : 0.0,
                    child: Container(color: Colors.black54),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: hovering ? 1.0 : 0.0,
                    child: SocialButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        LaunchUtils.openUrl(widget.project.github);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(isMobile ? 18 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: TextStyle(
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.project.subtitle,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: TextStyle(
                        height: 1.7,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.project.technologies
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.primary,
                          ),
                        ),
                        onPressed: () =>
                            LaunchUtils.openUrl(widget.project.github),
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          size: 20,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "View Source",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
