import 'package:expence_master/models/Plan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanList extends StatefulWidget {
  final void Function(PlanModel plan) onDeletePlan;
  final List<PlanModel> planList;

  const PlanList({Key? key, required this.planList, required this.onDeletePlan})
      : super(key: key);

  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.planList.length,
        itemBuilder: (context, index) {
          final plan = widget.planList[index];
          return Card(
            elevation: 3, // Adjust elevation as needed
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                plan.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount: ${plan.amount}',
                  ),
                  Text(
                    'Payment Date: ${DateFormat.yMMMd().format(plan.date)}', // Assuming plan.date is a DateTime object
                  ),
                ],
              ),
              trailing: ElevatedButton( 
                onPressed: () => widget.onDeletePlan(
                    plan), // Correctly pass the plan to the onDeletePlan function
                child: const Icon(Icons.task_alt_rounded),
              ),
            ),
          );
        },
      ),
    );
  }
}
