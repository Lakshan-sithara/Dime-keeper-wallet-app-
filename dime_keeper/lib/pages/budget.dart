import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  Expencers ex = Expencers();
  Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpenceList(
        
        expenceList: db.expenceList,
        onDeleteExpence: ex.onDeleteExpence,
      ),
      
      backgroundColor: const Color.fromARGB(255, 163, 237, 249),
    );
  }
}
