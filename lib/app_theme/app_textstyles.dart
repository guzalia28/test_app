import 'package:flutter/material.dart';
import 'package:test_app/app_theme/app_colors.dart';

class AppTextStyles {

  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.004,
  );

  static TextStyle button({Color? color}) => TextStyle(
    color: color?? AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.004,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.004,
  
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.08,
  );
}