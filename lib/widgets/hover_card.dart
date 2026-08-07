import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({
    super.key,
    required this.child,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,

        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -8.0 : 0.0,
          ),

        decoration: BoxDecoration(
          color: hovered
              ? AppColors.primary.withOpacity(.08)
              : AppColors.card,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: hovered
                ? AppColors.primary
                : AppColors.border,
          ),

          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.20),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),

        child: widget.child,
      ),
    );
  }
}