import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/models/filter.dart';
import 'package:test_app/models/transaction.dart';


class TransactionService extends GetxService {
  Box<Transaction> box = Hive.box<Transaction>(Constants.transactionsBox);
  List<Transaction> _transactions = [];
  var filter = Filter(category: Constants.filterCategories.first, type: Constants.filterTypes.first).obs;
  var transactions = <Transaction>[].obs;
  var categorySums = {}.obs;


  Future <TransactionService> init() async {
    fillTransactions();
    return this;
  }

  void fillTransactions() async{
    _transactions = box.values.toList();
    transactions.value = _transactions;
    transactions.sort((a, b) => b.date.compareTo(a.date));
    calculateCategorySums();
    getTotalIncome();
    getTotalExpense();
  }

  Future addTransaction(Transaction transaction) async {
    await box.add(transaction);
    _transactions.assignAll(box.values);
    fillTransactions();
  }

  void calculateCategorySums(){
    categorySums.value = {};
    for (var transaction in transactions) {
      if (transaction.type != 2) {
        String category = transaction.category ?? Constants.empty;
        categorySums[category] = (categorySums[category] ?? 0) + transaction.amount;
      }
    }
  }

  void editTransaction(int key, Transaction newTransactionData) async {
    await box.put(key, newTransactionData);
    fillTransactions();
  }

  void deleteTransaction(int key) async {
    await box.delete(key);
    fillTransactions();
  }

  void newFilter({String? category, FilterType? type}) {
    if (category != null) {
      if(category != filter.value.category){
        fillTransactions();
      }
      filter.value.category = category;
      if (filter.value.category != Constants.filterCategories.first) {
        filter.value.type = Constants.filterTypes.first;
        transactions.value = transactions.where((element) => element.category == filter.value.category).toList();
      } 
    } else if (type != null) {
      filter.value.type = type;
      filter.value.category = Constants.filterCategories.first;
      fillTransactions();
      if(filter.value.type != Constants.filterTypes.first){
        transactions.value = transactions.where((element) => element.type == filter.value.type.type.index).toList();
      }
    }
    filter.refresh();
  }

  double getTotalIncome() {
    return transactions.where((transaction) => transaction.type == 2).fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double getTotalExpense() {
    return transactions.where((transaction) => transaction.type == 1).fold(0.0, (sum, transaction) => sum + transaction.amount);
  }
}