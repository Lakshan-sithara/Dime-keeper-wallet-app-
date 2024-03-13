import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/add_new_expence.dart';
//import 'package:expence_master/widgets/expence_list.dart';
import 'package:expence_master/widgets/last_recode_overviwe.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

class Expencers extends StatefulWidget {
  const Expencers({super.key});

  //get onDeleteExpence => null;

  @override
  State<Expencers> createState() => _ExpencersState();

  
}

class _ExpencersState extends State<Expencers> {
  final _myBox = Hive.box('expenceDatabase');
  Database db = Database();

  // void onDeleteExpence(ExpenceModel expence) {
  //   print('Deleting expence: $expence');
  // }

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
      //###############App Bar###############
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateWidget(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 163, 237, 249),
        elevation: 3,
      ),
      body: Container(
        color: const Color.fromARGB(255, 170, 241, 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //############## Pie chart########
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: PieChart(dataMap: dataMap),
            ),
            const SizedBox(
              height: 10,
            ),
            //################ Over viwe card ##########
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: OverViweCard(),
            ),
            // ExpenceList(
            //   expenceList: db.expenceList,
            //   onDeleteExpence: onDeleteExpence,
            // ),

            //############# add icon ######################
            Stack(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(255, 83, 157, 241),
                          ),
                          child: IconButton(
                            onPressed: _openAddExpencesOverlay,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
