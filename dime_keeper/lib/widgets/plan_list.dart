import 'package:expence_master/models/Plan.dart';
import 'package:flutter/material.dart';

class PlanList extends StatefulWidget {
  const PlanList({super.key, required this.planList});

  final List<PlanModel> planList;

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
              subtitle: Text(
                'Progess: ${plan.amount}',
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.task_alt_rounded),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
