import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';
import 'package:test_app/models/filter.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  
  AddTransactionScreenController addTransactionScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  AnimatedContainer( 
      padding: const EdgeInsets.only(bottom: 16),
      duration: const Duration(milliseconds: 300),
      height: addTransactionScreenController.filter.value.type.type == Types.income ? 0 : 60,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: addTransactionScreenController.filter.value.type.type == Types.income ? 0.0 : 1.0,
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
          title: const Text(Constants.category, style: AppTextStyles.subtitle), 
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: Alignment.centerRight,
              borderRadius: BorderRadius.circular(8),
              elevation: 0,
              menuMaxHeight: 200,
              dropdownColor: AppColors.lightGrey,
              value: (){
                if(addTransactionScreenController.filter.value.category == Constants.filterCategories.first){
                  return Constants.filterCategories[1];
                } else {
                  return addTransactionScreenController.filter.value.category;
                }
              }(),
              icon: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.grey, size: 16),
              onChanged: (String? newValue) {
                addTransactionScreenController.filter.value.category = newValue!;
                addTransactionScreenController.filter.refresh();
              },
              items: Constants.filterCategories.sublist(1).map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: AppTextStyles.subtitle.copyWith(color: AppColors.darkGrey)),
                );
              }).toList(),
              style: const TextStyle(color: AppColors.lightBlack),
            ),
          ),
        ))
      ),
    );
  }
}