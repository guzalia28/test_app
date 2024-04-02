import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  final int type;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String? category;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String? title;

  Transaction({required this.type, required this.amount, this.category, required this.date, this.title});
}