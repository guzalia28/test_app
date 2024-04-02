import 'package:flutter/material.dart';
import 'package:test_app/app_theme/app_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightGrey,
      thickness: 1,
      height: 1,
    );
  }
}