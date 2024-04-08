import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expence_master/models/expence.dart';

class AddNewExpence extends StatefulWidget {
  final void Function(ExpenceModel expence) onAddExpence;

  const AddNewExpence({Key? key, required this.onAddExpence}) : super(key: key);

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Chatagary _selectedCategary = Chatagary.leasure;

  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime lastDate = DateTime(
    DateTime.now().year + 1,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime _selectedDate = DateTime.now();

  final DateFormat formattedDate = DateFormat('yyyy-MM-dd');

  Future<void> _openDateModel() async {
    try {
      final pickDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDate: initialDate,
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

  void _handleFormSubmit() {
    final userAmountText = _amountController.text.trim();
    if (_titleController.text.trim().isEmpty || userAmountText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content: const Text(
              "Please enter valid data for the title and the amount. The title can't be empty, and the amount can't be less than zero.",
            ),
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
      final userAmount = double.tryParse(userAmountText);
      if (userAmount != null && userAmount > 0) {
        ExpenceModel newExpence = ExpenceModel(
          amount: userAmount,
          title: _titleController.text.trim(),
          date: _selectedDate,
          categary: _selectedCategary,
        );
        widget.onAddExpence(newExpence);
        Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Enter valid amount'),
              content:
                  const Text('Please enter a valid amount greater than zero.'),
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
      }
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        backgroundColor: const Color(0xFFC9EDF7),
        actions: [
          IconButton(
            onPressed: _handleFormSubmit,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFDFF8FF),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title'),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Add new expense title',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Amount'),
                          TextField(
                            controller: _amountController,
                            decoration: const InputDecoration(
                              hintText: 'Amount',
                              //labelText: 'Enter amount here',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(formattedDate.format(_selectedDate)),
                          IconButton(
                            onPressed: _openDateModel,
                            icon: const Icon(Icons.date_range_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Text('Select a category: '),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: _selectedCategary,
                          items: Chatagary.values
                              .map((categary) => DropdownMenuItem(
                                    value: categary,
                                    child: Text(categary.name),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategary = value!;
                            });
                          },
                          dropdownColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
