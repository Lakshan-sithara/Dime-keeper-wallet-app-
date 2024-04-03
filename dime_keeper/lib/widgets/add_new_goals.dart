import 'package:expence_master/models/Goal.dart';
import 'package:expence_master/models/expence.dart';
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

  //date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _endDate = DateTime.now();

  //date picker
  Future<void> _openGDateModel() async {
    try {
      //show the date model then store the user selected date
      final pickDate = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate: initialDate);

      setState(() {
        _endDate = pickDate!;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  //handle form submit
  void _handleAddGoalFormSubmit() {
    // Get the text value from the _goalController
    final goalAmountText = _amountController.text.trim();
    final titleText = _titleController.text.trim();
    final goalText = _goalController.text.trim();

    //convert the goal amount to double
    final target = int.parse(goalText);

    final progress = int.parse(goalAmountText);

    // Check if the title or goal amount is empty
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
      //create a new goal
      GoalModel newGoal = GoalModel(
          title: titleText, date: _endDate, progress: progress, target: target);
      //save the data
      widget.addNewGoal(newGoal);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //add new goal
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Add new Goal title",
              labelText: 'Title',
            ),
            maxLength: 50,
          ),
          const SizedBox(height: 8), // Add spacing between fields
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    labelText: 'Add amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8), // Add spacing between fields
              // Date picker
              Expanded(
                child: Row(
                  children: [
                    Text(formattedDate.format(_endDate)),
                    IconButton(
                        onPressed: _openGDateModel,
                        icon: const Icon(Icons.calendar_month_outlined))
                  ],
                ),
              ),
            ],
          ),
          TextField(
            controller: _goalController,
            decoration: const InputDecoration(
              hintText: "Goal",
              labelText: 'Add Goal',
            ),
            keyboardType: TextInputType.number,
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
                  onPressed: _handleAddGoalFormSubmit,
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
