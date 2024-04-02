import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/services/transaction_service.dart';

class IncomeExpenseBarChart extends StatelessWidget {
  const IncomeExpenseBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionService transactionService = Get.find();

    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Obx(() => BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          maxY: transactionService.getTotalIncome() > transactionService.getTotalExpense()
              ? transactionService.getTotalIncome()
              : transactionService.getTotalExpense(),
          barTouchData: BarTouchData(enabled: false),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: transactionService.getTotalExpense(),
                  color: AppColors.redText,
                  width: 34,
                )
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: transactionService.getTotalIncome(),
                  color: Colors.green,
                  width: 34,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
