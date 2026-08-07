import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const SocialButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final size = isMobile ? 48.0 : 55.0;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
