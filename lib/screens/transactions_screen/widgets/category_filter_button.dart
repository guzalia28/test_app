import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/services/transaction_service.dart';

class CategoryFilterButton extends StatefulWidget {
  const CategoryFilterButton({super.key});

  @override
  State<CategoryFilterButton> createState() => _CategoryFilterButtonState();
}

class _CategoryFilterButtonState extends State<CategoryFilterButton> {
  final TransactionService transactionService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(8),
        elevation: 0,
        menuMaxHeight: 200,
        dropdownColor: AppColors.lightGrey,
        value: transactionService.filter.value.category,
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.lightBlue),
        onChanged: (String? newValue) {
          if(newValue != null) {
            transactionService.newFilter(category: newValue);
          }
        },
        items: Constants.filterCategories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: AppTextStyles.body),
          );
        }).toList(),
      ),
    ));
  }
}