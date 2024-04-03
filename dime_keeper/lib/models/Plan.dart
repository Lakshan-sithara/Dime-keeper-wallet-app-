import 'package:uuid/uuid.dart';

class PlanModel {
  PlanModel({
    required this.title,
    required this.date,
    required this.amount,
  }) : pid = const Uuid().v4();

  final String title;
  final DateTime date;
  final int amount;
  final String pid;
}
