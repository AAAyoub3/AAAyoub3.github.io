import 'package:flutter/material.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: const Text(
        "© 2026 Abdelrahman Ayoub • All Rights Reserved",
      ),
    );
  }
}