import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Category { food, travel, leasure, work }

class Expence extends StatefulWidget {
  const Expence({Key? key}) : super(key: key);

  @override
  State<Expence> createState() => _ExpenceState();
}

class _ExpenceState extends State<Expence> {
  final Database db = Database(); // Create an instance of Database

  @override
  void initState() {
    super.initState();
    db.loadData(); // Load data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ExpenceList(
            expenceList: db.expenceList,
            onDeleteExpence: onDeleteExpence,
          ),
        ),
      ],
    );
  }

  void onDeleteExpence(ExpenceModel expence) {
    setState(() {
      db.expenceList.remove(expence);
      db.updateData();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Delete Successful!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              db.expenceList.add(expence);
              db.updateData();
            });
          },
        ),
      ),
    );
  }
}
