import 'package:expence_master/models/budget.dart';
import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {
 final List<BudgetModel> budgetList;
 final void Function(BudgetModel) onDeleteBudget;

 const BudgetList({
    Key? key,
    required this.budgetList,
    required this.onDeleteBudget,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: budgetList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(budgetList[index].title),
              subtitle: Text(
                 'Budget: ${budgetList[index].budget} Spent: ${budgetList[index].spent}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDeleteBudget(budgetList[index]),
              ),
            ),
          );
        },
      ),
    );
 }
}
