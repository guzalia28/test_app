import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/constants/paddings.dart';
import 'package:test_app/controllers/add_transaction_screen_controller.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/my_divider.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/name_and_amount.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/pick_date.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/select_category.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/select_type.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/submit_button.dart';
import 'package:test_app/services/transaction_service.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  
  AddTransactionScreenController addTransactionScreenController = Get.put(AddTransactionScreenController());
  final TransactionService transactionService = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CupertinoNavigationBar(
          middle: const Text(Constants.addTransaction),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_rounded,size: 22),
          ),
          padding: const EdgeInsetsDirectional.only(start: 12),
          backgroundColor: AppColors.white,
          border: null,
        ),
        body: ListView(
          padding: Paddings.defaultPadding16,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: Paddings.defaultPadding16,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameAndAmount(),
                  MyDivider(),
                  SelectType(),
                  MyDivider(),
                  PickDate(),
                  MyDivider(),
                  SelectCategory(),
                  SizedBox(height: 16),
                  SubmitButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}