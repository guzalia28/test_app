import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/app_theme/app_textstyles.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/models/filter.dart';
import 'package:test_app/models/transaction.dart';
import 'package:test_app/services/transaction_service.dart';

class TransactionsList extends StatefulWidget {
  final int itemCount;
  final List<Transaction> transactions;
  const TransactionsList({super.key, required this.itemCount, required this.transactions});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {

  final TransactionService transactionService = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 72),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        final transaction = widget.transactions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SwipeableTile(
            key: Key(transaction.key.toString()), 
            isEelevated: false,
            backgroundBuilder: (offset, color, isSwiping) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete, color: AppColors.redText),
                  ),
                ],
              ),
            ),
            color: AppColors.background,
            onSwiped: (direction) {
              transactionService.deleteTransaction(transaction.key);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: transaction.title?? Constants.untitled,
                    style: AppTextStyles.subtitle,
                    children: [
                      transaction.category == null? const TextSpan() :
                      TextSpan(
                        text: ' / ${transaction.category}', 
                        style: AppTextStyles.body
                      ),
                    ]
                  ),
                ),
                subtitle: Text(
                  DateFormat(Constants.dateFormat).format(transaction.date), 
                  style: AppTextStyles.caption
                ),
                trailing: Text(
                  '${transaction.type == Types.income.index ? '+' : '-'} ${transaction.amount.toString()}', 
                  style: TextStyle(
                    color: transaction.type == Types.income.index ? AppColors.lightBlue : AppColors.redText, 
                    fontSize: 16
                  ),
                ),
              ),
            )
          ),
        );
      }
    );
  }
}