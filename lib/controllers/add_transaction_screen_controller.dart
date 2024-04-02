import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/models/filter.dart';
import 'package:test_app/models/transaction.dart';
import 'package:test_app/services/transaction_service.dart';

class AddTransactionScreenController extends GetxController {

  var filter = Filter(category: Constants.filterCategories[1], type: Constants.filterTypes[1]).obs;
  var amountController = TextEditingController().obs;
  final titleController = TextEditingController();
  final amountFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();


  Future submitForm() async{

    if (amountController.value.text.isNotEmpty) {
      final newTransaction = Transaction(
        type: filter.value.type.type.index,
        amount: double.parse(amountController.value.text),
        category: filter.value.type.type.index != 2? filter.value.category : null,
        date: selectedDate,
        title: titleController.text.isEmpty ? null : titleController.text,
      );

      await Get.find<TransactionService>().addTransaction(newTransaction);

    } 
  }
}