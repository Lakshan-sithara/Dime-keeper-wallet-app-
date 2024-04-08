import 'package:expence_master/models/Goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewGoals extends StatefulWidget {
  final Function(GoalModel) addNewGoal;
  const AddNewGoals({Key? key, required this.addNewGoal}) : super(key: key);

  @override
  State<AddNewGoals> createState() => _AddNewGoalsState();
}

class _AddNewGoalsState extends State<AddNewGoals> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _goalController = TextEditingController();

  final DateFormat formattedDate = DateFormat('yyyy-MM-dd');

  DateTime _endDate = DateTime.now();

  Future<void> _openGDateModel() async {
    try {
      final pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
      );

      if (pickDate != null) {
        setState(() {
          _endDate = pickDate;
        });
      }
    } catch (err) {
      print(err.toString());
    }
  }

  void _handleAddGoalFormSubmit() {
    final goalAmountText = _amountController.text.trim();
    final titleText = _titleController.text.trim();
    final goalText = _goalController.text.trim();

    final target = int.tryParse(goalText) ?? 0;
    final progress = int.tryParse(goalAmountText) ?? 0;

    if (titleText.isEmpty || goalAmountText.isEmpty || goalText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content:
                const Text('Please enter valid data for the amount and title'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      GoalModel newGoal = GoalModel(
        title: titleText,
        date: _endDate,
        progress: progress,
        target: target,
      );
      widget.addNewGoal(newGoal);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Goal'),
        backgroundColor: const Color(0xFFC9EDF7),
        actions: [
          IconButton(
            onPressed: _handleAddGoalFormSubmit,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFDFF8FF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Title'),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Add new Goal title",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLength: 50,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Add Amount'),
                          TextField(
                            controller: _amountController,
                            decoration: const InputDecoration(
                              hintText: "Amount",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: Row(
                        children: [
                          Text(formattedDate.format(_endDate)),
                          IconButton(
                            onPressed: _openGDateModel,
                            icon: const Icon(Icons.calendar_today),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Goal'),
                TextField(
                  controller: _goalController,
                  decoration: const InputDecoration(
                    hintText: "Goal",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
