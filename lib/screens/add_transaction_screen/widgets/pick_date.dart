import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/constants/paddings.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  AddTransactionScreenController addTransactionScreenController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: const Text(Constants.date, style: AppTextStyles.subtitle),
      subtitle: Text(
        DateFormat(Constants.dateFormat).format(addTransactionScreenController.selectedDate), 
        style: AppTextStyles.caption
      ),
      onTap: _pickDate,
      trailing: const Icon(
        Icons.calendar_today_rounded,
        color: AppColors.grey,
      ),
      backgroundColorActivated: Colors.transparent,
      padding: Paddings.verticalPadding16,
    );
  }
  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.lightBlue,
              onPrimary: AppColors.white,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: addTransactionScreenController.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != addTransactionScreenController.selectedDate) {
      if (mounted) {
        setState(() {
          addTransactionScreenController.selectedDate = pickedDate;
        });
      }
    }
  }
}