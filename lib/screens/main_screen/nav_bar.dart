import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/app_theme/app_colors.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/charts_screen/charts_screen.dart';
import 'package:test_app/screens/transactions_screen/transactions_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60,
          backgroundColor: AppColors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.paid),
              label: Constants.transactions,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.donut_large),
              label: Constants.chart,
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return const TransactionsScreen();
                case 1:
                  return const ChartsScreen();
                default:
                  return const Placeholder();
              }
            },
          );
        },
      )
    );
  }
}