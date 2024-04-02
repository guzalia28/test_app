
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/paddings.dart';
import 'package:test_app/screens/add_transaction_screen/widgets/my_divider.dart';
import 'package:test_app/screens/charts_screen/widgets/income_expense_bar.dart';
import '../../app_theme/app_colors.dart';
import '../../app_theme/app_textstyles.dart';
import '../../constants/constants.dart';
import '../../services/transaction_service.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  final TransactionService transactionService = Get.find();
  
  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
      body: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            stretch: true,
            largeTitle: Text(Constants.chart),
            backgroundColor: AppColors.white,
            border: null,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(32),
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: PieChart(
                      PieChartData(
                        sections: transactionService.categorySums.entries.map((entry) {
                          final colorIndex = transactionService.categorySums.keys.toList().indexOf(entry.key) % AppColors.pieChartColors.length;
                          return PieChartSectionData(
                            color: AppColors.pieChartColors[colorIndex],
                            value: entry.value,
                            showTitle: false,
                            radius: MediaQuery.of(context).size.width * 0.4 - 80,
                          );
                        }).toList(),
                        centerSpaceRadius: 40,
                        sectionsSpace: 0,
                        borderData: FlBorderData(show: false),
                        centerSpaceColor: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(Constants.expenses, style: AppTextStyles.title),
                        const Padding(
                          padding: Paddings.verticalPadding16,
                          child: MyDivider(),
                        ),
                        Wrap(
                          runSpacing: 10,
                          alignment: WrapAlignment.start,
                          spacing: 20,
                          children: transactionService.categorySums.keys.toList().asMap().entries.map((entry) {
                            int index = entry.key;
                            String category = entry.value;
                            String value = transactionService.categorySums[category].toString();
                            Color color = AppColors.pieChartColors[index % AppColors.pieChartColors.length];
                            return legendItem(category, color, value);
                          }).toList(),
                        ),
                        
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )
            ),  
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: Paddings.defaultPadding16,
              padding: Paddings.defaultPadding16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  const IncomeExpenseBarChart(),
                  const Row(
                    children: [
                      Text(Constants.chart, style: AppTextStyles.title),
                    ],
                  ),
                  const Padding(padding: Paddings.verticalPadding16,
                    child: MyDivider(),
                  ),
                  Padding(
                    padding: Paddings.bottomPadding16,
                    child: Row(
                      children: [
                        legendItem(Constants.expenses, AppColors.redText, transactionService.getTotalExpense().toString()),
                        const SizedBox(width: 16),
                        legendItem(Constants.income, Colors.green, transactionService.getTotalIncome().toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget legendItem(String name, Color color, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
        ),
        const SizedBox(width: 8),
        Text('$name $value', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}