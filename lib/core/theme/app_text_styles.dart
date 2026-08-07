import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const heroTitle = TextStyle(
    fontSize: 58,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static const heroSubtitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const sectionTitle = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontSize: 18,
    color: AppColors.textSecondary,
    height: 1.8,
  );

  static const cardTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}