import 'package:test_app/models/filter.dart';
import 'package:test_app/models/period.dart';

class Constants {
  Constants._();

  static const String empty = '';

  //routes
  static const String homeRoute = '/';
  static const String addTransactionRoute = '/addTransaction';
  static const String transactionsRoute = '/transactions';
  static const String chartsRoute = '/charts';

  //strings
  static const String transactions = 'Transactions';
  static const String income = 'Income';
  static const String expense = 'Expense';
  static const String expenses = 'Expenses';
  static const String addTransaction = 'Add Transaction';
  static const String category = 'Category';
  static const String amount = 'Amount';
  static const String date = 'Date';
  static const String add = 'Add';
  static const String history = 'History';
  static const String untitled = 'Untitled';
  static const String chart = 'Statistics';
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String transactionName = 'Transaction Name';
  static const String error = 'Error';
  static const String amountError = 'Please enter a valid amount';
  static const String type = 'Type';

  //db
  static const String transactionsBox = 'transactions';

  //date format
  static const String dateFormat = 'dd.MM.yyyy';




  static const List<String> filterCategories = [
    'All Categories',
    'Food',
    'Transport',
    'Entertainment',
    'Health',
    'Education',
    'Salary',
    'Utilities',
    'Clothing',
    'Gifts',
    'Personal Care',
    'Travel',
    'Other',
  ];

  static const List<Period> period = [
    Period(name: 'Day', period: Periods.day),
    Period(name: 'Week', period: Periods.week),
    Period(name: 'Month', period: Periods.month),
    Period(name: 'Year', period: Periods.year),
    Period(name: 'All Time', period: Periods.all),
  ];

  static List<FilterType> filterTypes = [
    FilterType(name: 'All Types', type: Types.all),
    FilterType(name: 'Expense', type: Types.expense),
    FilterType(name: 'Income', type: Types.income),
  ];
}