import 'package:expence_master/models/Goal.dart';
import 'package:expence_master/widgets/edit_goals.dart';
import 'package:flutter/material.dart';

class GoalList extends StatelessWidget {
  final void Function(GoalModel goal) onDeleteGoal;
  final void Function(GoalModel goal, double amount) onAddGoal;
  final List<GoalModel> goalList;

  const GoalList(
      {Key? key,
      required this.goalList,
      required this.onDeleteGoal,
      required this.onAddGoal})
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _openGoalEditOverlay(context, goal),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDeleteGoal(goal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _openGoalEditOverlay(BuildContext context, GoalModel goal) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditGoals(
          onAddGoal: onAddGoal,
          goalList: goalList.map((goal) => goal.title).toList(),
          goal: goal,
        );
      },
    );
  }
}
