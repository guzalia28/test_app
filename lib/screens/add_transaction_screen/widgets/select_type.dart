import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/constants/paddings.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';
import 'package:test_app/models/filter.dart';

class SelectType extends StatefulWidget {
  const SelectType({super.key});

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  
  AddTransactionScreenController addTransactionScreenController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: const Text(Constants.type, style: AppTextStyles.subtitle),
      trailing: CupertinoSlidingSegmentedControl(
        groupValue: addTransactionScreenController.filter.value.type.type,
        thumbColor: AppColors.white,
        backgroundColor: AppColors.lightGrey,
        children: const {
          Types.expense: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(Constants.expense, style: AppTextStyles.body),
          ),
          Types.income: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(Constants.income, style: AppTextStyles.body),
          ),
        },
        onValueChanged: (value) {
          if(mounted) {
            setState(() {
              addTransactionScreenController.filter.value.type.type = value!;
            });
            addTransactionScreenController.filter.refresh();
          }
        },
      ),
      backgroundColorActivated: Colors.transparent,
      padding: Paddings.verticalPadding16,
    );
  }
}