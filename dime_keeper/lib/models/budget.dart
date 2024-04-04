import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();

class BudgetModel{
  final String id;
  
  BudgetModel({required this.budget, required this.spent,required this.title}) : id = uuid;
  final String title;
  final int budget;
   int spent;
  //final DateTime date;
}