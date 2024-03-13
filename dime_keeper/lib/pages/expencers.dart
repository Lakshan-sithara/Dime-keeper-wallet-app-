import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/add_new_expence.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

class Expencers extends StatefulWidget {
  const Expencers({super.key});

  @override
  State<Expencers> createState() => _ExpencersState();
}

class _ExpencersState extends State<Expencers> {
  final _myBox = Hive.box('expenceDatabase');
  Database db = Database();

  //expence list
  // final List<ExpenceModel> _expenceList = [
  //   ExpenceModel(
  //       amount: 12.4,
  //       title: "footBall",
  //       date: DateTime.now(),
  //       categary: Chatagary.leasure),
  //   ExpenceModel(
  //       amount: 25,
  //       title: "bus",
  //       date: DateTime.now(),
  //       categary: Chatagary.travel),
  //   ExpenceModel(
  //       amount: 30,
  //       title: "carrot",
  //       date: DateTime.now(),
  //       categary: Chatagary.food),
  //   ExpenceModel(
  //       amount: 20,
  //       title: 'bag',
  //       date: DateTime.now(),
  //       categary: Chatagary.travel),
  // ];
  //PIE chart
  Map<String, double> dataMap = {
    "Food": 0,
    "Travel": 0,
    "Leasure": 0,
    "Work": 0,
  };

  //add new expence
  void onAddNewExpence(ExpenceModel expence) {
    setState(() {
      db.expenceList.add(expence);
      calCatagaryValue();
    });
    db.updateData();
  }

  //remove a expence
  void onDeleteExpence(ExpenceModel expence) {
    //store the deleting expence
    ExpenceModel deletingExpence = expence;

    //get the index of removing expence
    final int removingIndex = db.expenceList.indexOf(expence);
    setState(() {
      db.expenceList.remove(expence);
      db.updateData();
      calCatagaryValue();
    });

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Delete Successful!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              db.expenceList.insert(removingIndex, deletingExpence);
              calCatagaryValue();
            });
          },
        ),
      ),
    );
  }

  //PIE chart calculation
  double foodVal = 0;
  double travelVal = 0;
  double leasureVal = 0;
  double workVal = 0;

  void calCatagaryValue() {
    double foodValTotal = 0;
    double travelValTotal = 0;
    double leasureValTotal = 0;
    double workValTotal = 0;

    for (final expence in db.expenceList) {
      if (expence.categary == Chatagary.food) {
        foodValTotal += expence.amount;
      }
      if (expence.categary == Chatagary.travel) {
        travelValTotal += expence.amount;
      }
      if (expence.categary == Chatagary.leasure) {
        leasureValTotal += expence.amount;
      }
      if (expence.categary == Chatagary.work) {
        workValTotal += expence.amount;
      }
    }
    setState(() {
      foodVal = foodValTotal;
      travelVal = travelValTotal;
      leasureVal = leasureValTotal;
      workVal = workValTotal;
    });

    //update the data map
    dataMap = {
      "Food": foodVal,
      "Travel": travelVal,
      "Leasure": leasureVal,
      "Work": workVal,
    };
  }

  @override
  void initState() {
    super.initState();
    //if this is the first time create the initial data
    if (_myBox.get('EXP_DATA') == null) {
      db.createInitialDatabase();
      calCatagaryValue();
    } else {
      db.loadData();
      calCatagaryValue();
    }
  }

//Function to open a model overlay

  void _openAddExpencesOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddNewExpence(
            onAddExpence: onAddNewExpence,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateWidget(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 170, 241, 250),
        elevation: 3,
        // actions: [
        //   Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(100),
        //       color: Colors.white,
        //     ),
        //     child: IconButton(
        //       onPressed: _openAddExpencesOverlay,
        //       icon: const Icon(
        //         Icons.add,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ),
        //],
      ),
      body: Column(
        children: [
          PieChart(dataMap: dataMap),
          ExpenceList(
            expenceList: db.expenceList,
            onDeleteExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
