import 'package:expence_master/models/Goal.dart';
import 'package:expence_master/widgets/edit_goals.dart';
import 'package:flutter/material.dart';

class GoalList extends StatefulWidget {
  const GoalList({Key? key, required this.goalList}) : super(key: key);

  final List<GoalModel> goalList;

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  //function to open medel overlay
  void _openGoalEditOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditGoals();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.goalList.length,
        itemBuilder: (context, index) {
          final goal = widget.goalList[index];
          return Card(
            elevation: 3, // Adjust elevation as needed
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                goal.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Progess: ${goal.progress}/${goal.target}',
              ),
              trailing: ElevatedButton(
                onPressed: _openGoalEditOverlay,
                child: const Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
