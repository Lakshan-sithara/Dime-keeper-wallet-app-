import 'package:expence_master/models/budget.dart';
import 'package:expence_master/widgets/budget_list.dart';
import 'package:flutter/material.dart';
import 'package:expence_master/widgets/add_new_budget.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final List<BudgetModel> _budgetList = [
    BudgetModel(budget: 1000, spent: 500, title: 'Budget 1'),
    BudgetModel(budget: 2000, spent: 1000, title: 'Budget 2'),
    BudgetModel(budget: 3000, spent: 1500, title: 'Budget 3')
  ];

  void _handleDeleteBudget(BudgetModel budget) {
    setState(() {
      _budgetList.remove(budget);
    });
  }

  void addNewBudget(BudgetModel budget) {
    setState(() {
      _budgetList.add(budget);
    });
  }

  //function to open budget model overlay
  void _openaddBudgetOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewBudget(
          onAddBudget: addNewBudget,
        ); // Corrected the placement of the closing parenthesis here
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 237, 249),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Budgets',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Icon(
                            Icons.monetization_on_outlined,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Budget',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('How much I can spend'),
                        ],
                      )
                    ],
                  ),
                  BudgetList(
                      budgetList: _budgetList,
                      onDeleteBudget: _handleDeleteBudget),
                  ElevatedButton(
                    onPressed: _openaddBudgetOverlay,
                    child: const Text('Create New Budget'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
