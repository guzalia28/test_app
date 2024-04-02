import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/constants/paddings.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';

class NameAndAmount extends StatefulWidget {
  const NameAndAmount({super.key});

  @override
  State<NameAndAmount> createState() => _NameAndAmountState();
}

class _NameAndAmountState extends State<NameAndAmount> {
  AddTransactionScreenController addTransactionScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.bottomPadding16,
      child: Row(
        children: [
          Flexible(
            child: CupertinoTextField(
              autofocus: true,
              controller: addTransactionScreenController.titleController,
              cursorColor: AppColors.lightBlack,
              cursorWidth: 1,
              style: AppTextStyles.subtitle,
              textCapitalization: TextCapitalization.sentences,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.background
                ),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.background,
              ),
              placeholder: Constants.transactionName,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Obx(() => CupertinoTextField(
              focusNode: addTransactionScreenController.amountFocusNode,
              controller: addTransactionScreenController.amountController.value,
              cursorColor: AppColors.lightBlack,
              cursorWidth: 1,
              style: AppTextStyles.subtitle,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.background
                ),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.background,
              ),
              placeholder: Constants.amount,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  if (value.isNotEmpty && double.parse(value) == 0) {
                    addTransactionScreenController.amountController.value.clear();
                  } else {
                    if (mounted) {
                    setState(() {
                      addTransactionScreenController.amountController.value.text = value;
                    });}
                    addTransactionScreenController.amountController.refresh();
                  }
                } catch (e) {
                  addTransactionScreenController.amountController.value.clear();
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}