import 'package:expence_master/models/Plan.dart';
import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  final Function(PlanModel plan) onAddPlan;
  const AddPlan({super.key, required this.onAddPlan});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  final _planTitleController = TextEditingController();
  final _planController = TextEditingController();

  //date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();

  //date picker
  Future<void> _openPDateModel() async {
    try {
      //show the date model then store the user selected date
      final pickDate = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate: initialDate);

      setState(() {
        _selectedDate = pickDate!;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  //haddle form submit
  void _hadleGoalFormSubmit() {
    final planTitleText = _planTitleController.text.trim();
    final planText = _planController.text.trim();
    final planAmount = int.parse(planText);

    if (planTitleText.isEmpty || planText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content: const Text('Plaease Enter valid data'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'))
            ],
          );
        },
      );
    } else {
      //create a new plan 
      PlanModel plan = PlanModel(
          title: planTitleText, date: _selectedDate, amount: planAmount);
      //save data
      widget.onAddPlan(plan);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _planTitleController.dispose();
    _planController.dispose();
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
            controller: _planTitleController,
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
                  controller: _planController,
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
                    Text(formattedDate.format(_selectedDate)),
                    IconButton(
                        onPressed: _openPDateModel,
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
                  onPressed: _hadleGoalFormSubmit,
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
