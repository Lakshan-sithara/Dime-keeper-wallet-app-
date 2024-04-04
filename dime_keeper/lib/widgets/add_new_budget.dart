import 'package:expence_master/models/budget.dart';
import 'package:flutter/material.dart';

class AddNewBudget extends StatefulWidget {
  final void Function(BudgetModel budget) onAddBudget;
  const AddNewBudget({super.key, required this.onAddBudget});

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

  //handle form submit
  void _handleFormSubmit() {
    //form validations
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
                child: const Text('Ok'),
              )
            ],
          );
        },
      );
    } else {
      //create the new expence
      final newBudget = BudgetModel(
          budget: userAmount,
          spent: 0,
          title: _budgetTitleController.text.trim());
      //add new budget
      widget.onAddBudget(newBudget);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _budgetTitleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            hintText: 'Enter the title',
          ),
        ),
        TextField(
          controller: _budgetAmountController,
          decoration: const InputDecoration(
            labelText: 'Budget',
            hintText: 'Enter the budget amount',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 20),
            ElevatedButton(
                onPressed: () {
                  _handleFormSubmit();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child:
                    const Text('Add', style: TextStyle(color: Colors.white))),
          ],
        )
      ],
    );
  }
}
