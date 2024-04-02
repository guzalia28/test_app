import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';

import '../../../constants/constants.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  
  AddTransactionScreenController addTransactionScreenController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () async{
        if (addTransactionScreenController.amountController.value.text.isEmpty) {
          addTransactionScreenController.amountFocusNode.requestFocus();
          Get.snackbar(
            Constants.error,
            Constants.amountError,
            titleText: const Text(
              Constants.error,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            messageText: const Text(
              Constants.amountError,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColors.lightBlue.withOpacity(0.7),
            colorText: Colors.white,
            margin: const EdgeInsets.all(16),
            borderRadius: 12,
            duration: const Duration(seconds: 2),
          );
        } else {
          Navigator.of(context).pop();
          await addTransactionScreenController.submitForm();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: addTransactionScreenController.amountController.value.text.isEmpty ? AppColors.grey : AppColors.lightBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          Constants.add,
          style: AppTextStyles.button(),
        ),
      ),
    ));
  }
}