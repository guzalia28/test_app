import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/models/filter.dart';
import 'package:test_app/services/transaction_service.dart';

class TypeFilterButton extends StatefulWidget {
  const TypeFilterButton({super.key});

  @override
  State<TypeFilterButton> createState() => _TypeFilterButtonState();
}

class _TypeFilterButtonState extends State<TypeFilterButton> {
  final TransactionService transactionService = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
      child: DropdownButton<FilterType>(
        borderRadius: BorderRadius.circular(8),
        elevation: 0,
        menuMaxHeight: 200,
        dropdownColor: AppColors.lightGrey,
        value: transactionService.filter.value.type,
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.lightBlue),
        onChanged: (FilterType? newValue) {
          if(newValue != null) {
            transactionService.newFilter(type: newValue);
          }
        },
        items: Constants.filterTypes.map<DropdownMenuItem<FilterType>>((FilterType value) {
          return DropdownMenuItem<FilterType>(
            value: value,
            child: Text(value.name, style: AppTextStyles.body),
          );
        }).toList(),
      ),
    ));
  }
}