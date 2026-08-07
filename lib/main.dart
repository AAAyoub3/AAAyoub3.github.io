import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'portfolio_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Abdelrahman Ayoub",

  theme: ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    useMaterial3: true,

    fontFamily: "Poppins",
  ),

  home: const PortfolioPage(),
);
  }
}
