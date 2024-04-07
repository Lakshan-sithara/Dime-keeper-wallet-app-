import 'package:expence_master/widgets/last_recode_overviwe.dart';
import 'package:expence_master/widgets/menu.dart';
import 'package:expence_master/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/add_new_expence.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive/hive.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package for DonutPieChart

class Expencers extends StatefulWidget {
  const Expencers({Key? key}) : super(key: key);

  @override
  State<Expencers> createState() => _ExpencersState();
}

class _ExpencersState extends State<Expencers> {
  final _myBox = Hive.box('expenceDatabase');
  Database db = Database();

  Map<String, double> dataMap = {
    "Food": 0,
    "Travel": 0,
    "Leasure": 0,
    "Work": 0,
  };

  double totalExpense = 0;

  void onAddNewExpence(ExpenceModel expence) {
    setState(() {
      db.expenceList.add(expence);
      calCatagaryValue();
    });
    db.updateData();
  }

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

    dataMap = {
      "Food": foodVal,
      "Travel": travelVal,
      "Leasure": leasureVal,
      "Work": workVal,
    };

    setState(() {
      dataMap = {
        "Food": foodValTotal,
        "Travel": travelValTotal,
        "Leisure": leasureValTotal,
        "Work": workValTotal,
      };
      totalExpense = foodValTotal +
          travelValTotal +
          leasureValTotal +
          workValTotal; // Update totalExpense
    });
  }

  @override
  void initState() {
    super.initState();
    if (_myBox.get('EXP_DATA') == null) {
      db.createInitialDatabase();
      calCatagaryValue();
    } else {
      db.loadData();
      calCatagaryValue();
    }
  }

  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpence(
          onAddExpence: onAddNewExpence,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      appBar: SliderAppBar(
        appBarColor: Color(0xFFC9EDF7),
        title: Text(
          "Dashboard",
          style: TextBlackStyleTopNavHeading(),
        ),
      ),
      slider: Menu(),
      child: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              // Wrap the Column with SingleChildScrollView
              child: Container(
                color: const Color(0xFFDFF8FF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Expense Structure',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                'THIS MONTH',
                              ),
                              Text(
                                'LKR $totalExpense',
                                style: const TextStyle(fontSize: 30),
                              ),
                              Center(
                                child: SizedBox(
                                  width:
                                      250, // Adjust the width of the SizedBox
                                  height:
                                      250, // Adjust the height of the SizedBox
                                  child: PieChart(
                                    PieChartData(
                                      sections: dataMap.entries.map((entry) {
                                        return PieChartSectionData(
                                          color: _getColor(entry.key),
                                          value: entry.value,
                                          title: entry.key,
                                          radius: 100,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: OverViweCard(
                            dataMap: dataMap), // Use OverViweCard with dataMap
                      ),
                      // ExpenceList(
                      //   expenceList: db.expenceList,
                      //   onDeleteExpence: onDeleteExpence,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            //###### Add Button ######
            Positioned(
              bottom: 16,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FloatingActionButton(
                  onPressed: _openAddExpencesOverlay,
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Color _getColor(String category) {
    // Add logic to return colors based on categories
    // For example, you can return different colors for Food, Travel, Leisure, Work, etc.
    // You can use switch statements or if-else conditions to define colors based on categories.
    switch (category) {
      case 'Food':
        return Colors.red;
      case 'Travel':
        return Colors.blue;
      case 'Leisure':
        return Colors.green;
      case 'Work':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
