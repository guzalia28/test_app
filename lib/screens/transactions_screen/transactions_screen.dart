import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/transactions_screen/widgets/category_filter_button.dart';
import 'package:test_app/screens/transactions_screen/widgets/transactions_list.dart';
import 'package:test_app/screens/transactions_screen/widgets/type_filter_button.dart';
import 'package:test_app/services/transaction_service.dart';

import '../../models/transaction.dart';
import '../add_transaction_screen/add_transaction_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final TransactionService transactionService = Get.find();

  late Stream<List<Transaction>> transactionsStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            stretch: true,
            alwaysShowMiddle: false,
            largeTitle: Text(Constants.transactions),
            backgroundColor: AppColors.white,
            border: null,
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CategoryFilterButton(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16, top: 16, bottom: 8),
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TypeFilterButton()
                ),
              ],
            )
          ),
          SliverToBoxAdapter(
            child: Obx(() => TransactionsList(
              itemCount: transactionService.transactions.length, 
              transactions: transactionService.transactions
            ))
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddTransactionScreen());
        },
        backgroundColor: AppColors.lightBlue,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add, color: 
          AppColors.white,
          size: 32,
        ),
      ),
    );
  }
}