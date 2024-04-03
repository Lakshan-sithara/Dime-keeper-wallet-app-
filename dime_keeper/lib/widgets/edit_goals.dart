import 'package:expence_master/models/Goal.dart';
import 'package:flutter/material.dart';

class EditGoals extends StatefulWidget {
  final void Function(GoalModel goal, double amount) onAddGoal;
  final GoalModel goal;
  final List<String> goalList;
  const EditGoals({super.key, required this.onAddGoal, required this.goalList, required this.goal});

  @override
  State<EditGoals> createState() => _EditGoalsState();
}

class _EditGoalsState extends State<EditGoals> {
  final _ggoalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ggoalController,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    labelText: 'Add amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8), // Add spacing between fields
              // Date picker
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //close model button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                //save button
                ElevatedButton(
                  onPressed: () {
                    double amount = double.tryParse(_ggoalController.text) ?? 0;
                 widget.onAddGoal( widget.goal, amount);
                 Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child:
                      const Text('Save', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
