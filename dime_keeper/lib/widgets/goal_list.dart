import 'package:expence_master/models/Goal.dart';
import 'package:expence_master/widgets/edit_goals.dart';
import 'package:flutter/material.dart';

class GoalList extends StatelessWidget {
  final void Function(GoalModel goal) onDeleteGoal;
  final List<GoalModel> goalList;
  const GoalList({Key? key, required this.goalList, required this.onDeleteGoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: goalList.length,
        itemBuilder: (context, index) {
          final goal = goalList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                goal.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Progress: ${goal.progress}/${goal.target}',
              ),
              trailing: ElevatedButton(
                onPressed: () => _openGoalEditOverlay(context),
                child: const Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openGoalEditOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const EditGoals();
      },
    );
  }
}
