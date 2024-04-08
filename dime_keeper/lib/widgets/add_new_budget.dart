import 'package:expence_master/models/budget.dart';
import 'package:flutter/material.dart';

class AddNewBudget extends StatefulWidget {
  final void Function(BudgetModel budget) onAddBudget;
  const AddNewBudget({Key? key, required this.onAddBudget}) : super(key: key);

  @override
  State<AddNewBudget> createState() => _AddNewBudgetState();
}

class _AddNewBudgetState extends State<AddNewBudget> {
  final _budgetTitleController = TextEditingController();
  final _budgetAmountController = TextEditingController();

  @override
  void dispose() {
    _budgetTitleController.dispose();
    _budgetAmountController.dispose();
    super.dispose();
  }

  // handle form submit
  void _handleFormSubmit() {
    // form validations
    final userAmount = int.tryParse(_budgetAmountController.text.trim());
    if (_budgetTitleController.text.trim().isEmpty ||
        _budgetAmountController.text.trim().isEmpty ||
        userAmount == null ||
        userAmount < 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content: const Text(
                "Please enter the valid data for the title and the amount. The title can't be empty, and the amount can't be less than zero."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              )
            ],
          );
        },
      );
    } else {
      // create the new expense
      final newBudget = BudgetModel(
        budget: userAmount,
        spent: 0,
        title: _budgetTitleController.text.trim(),
      );
      // add new budget
      widget.onAddBudget(newBudget);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Budget'),
        backgroundColor: const Color(0xFFC9EDF7),
        actions: [
          IconButton(
            onPressed: _handleFormSubmit,
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Container(
        color: Color(0xFFDFF8FF),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title'),
                TextField(
                  controller: _budgetTitleController,
                  decoration: const InputDecoration(
                    //labelText: 'Title',
                    hintText: 'Enter the title',
                    filled: true,
                    fillColor: Colors.white, // Set background color here
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Budget'),
                TextField(
                  controller: _budgetAmountController,
                  decoration: const InputDecoration(
                    //labelText: 'Budget',
                    hintText: 'Enter the budget amount',
                    filled: true,
                    fillColor: Colors.white, // Set background color here
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
