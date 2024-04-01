import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class AddNewGoals extends StatefulWidget {
  const AddNewGoals({Key? key}) : super(key: key);

  @override
  State<AddNewGoals> createState() => _AddNewGoalsState();
}

class _AddNewGoalsState extends State<AddNewGoals> {
  final _titleController = TextEditingController();
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
  void _handleGoalFormSubmit() {
    //form validations
    //convert the double in to a double
    final goalAmount = double.parse(_goalController.toString().trim());
    print(goalAmount);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                  controller: _goalController,
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
                  onPressed: _handleGoalFormSubmit,
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
