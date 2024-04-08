import 'package:expence_master/models/Plan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPlan extends StatefulWidget {
  final Function(PlanModel plan) onAddPlan;
  const AddPlan({Key? key, required this.onAddPlan}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  final _planTitleController = TextEditingController();
  final _planController = TextEditingController();

  final DateFormat formattedDate = DateFormat('yyyy-MM-dd');

  DateTime _selectedDate = DateTime.now();

  Future<void> _openPDateModel() async {
    try {
      final pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
      );

      if (pickDate != null) {
        setState(() {
          _selectedDate = pickDate;
        });
      }
    } catch (err) {
      print(err.toString());
    }
  }

  void _hadleGoalFormSubmit() {
    final planTitleText = _planTitleController.text.trim();
    final planText = _planController.text.trim();
    final planAmount = int.tryParse(planText) ?? 0;

    if (planTitleText.isEmpty || planText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content: const Text('Please enter valid data'),
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
      PlanModel plan = PlanModel(
        title: planTitleText,
        date: _selectedDate,
        amount: planAmount,
      );
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Plan'),
        backgroundColor: const Color(0xFFC9EDF7),
        actions: [
          IconButton(
            onPressed: _hadleGoalFormSubmit,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFDFF8FF),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Title'),
              TextField(
                controller: _planTitleController,
                decoration: const InputDecoration(
                  hintText: "Add new Goal title",
                  //labelText: 'Title',
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLength: 50,
              ),
              const SizedBox(height: 8), // Add spacing between fields
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Add Amount'),
                        TextField(
                          controller: _planController,
                          decoration: const InputDecoration(
                            hintText: "Amount",
                            filled: true,
                            fillColor: Colors.white,
                            //labelText: 'Add amount',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
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
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
