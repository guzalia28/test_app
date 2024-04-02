import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/screens/add_transaction_screen/add_transaction_screen.dart';
import 'package:test_app/screens/charts_screen/charts_screen.dart';
import 'package:test_app/screens/transactions_screen/transactions_screen.dart';
import 'package:test_app/services/transaction_service.dart';
import 'package:test_app/models/transaction.dart';
import 'constants/constants.dart';
import 'screens/main_screen/nav_bar.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>(Constants.transactionsBox);
  await Get.putAsync(() => TransactionService().init());
  runApp(const GetMaterialApp (home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavBar(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightBlue,
          onPrimary: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      initialRoute: Constants.homeRoute, 
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {

          case Constants.homeRoute : return MaterialPageRoute(
            builder: (_) => const NavBar(),
            settings: settings
          );

          case Constants.addTransactionRoute : return MaterialPageRoute(
            builder: (_) => const AddTransactionScreen(),
            settings: settings
          );

          case Constants.transactionsRoute : return MaterialPageRoute(
            builder: (_) => const TransactionsScreen(),
            settings: settings
          );

          case Constants.chartsRoute : return MaterialPageRoute(
            builder: (_) => const ChartsScreen(),
            settings: settings
          );

        }

        return null;
      },
    );
  }
}
