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
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion Flutter Charts

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

  void _openAddExpensesOverlay() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: AddNewExpence(
            onAddExpence: onAddNewExpence,
          ),
        ),
      ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 250,
                                        height: 250,
                                        child: SfCircularChart(
                                          series: <CircularSeries>[
                                            DoughnutSeries<Map<String, double>,
                                                String>(
                                              dataSource: dataMap.entries
                                                  .toList()
                                                  .map((entry) =>
                                                      {entry.key: entry.value})
                                                  .toList(),
                                              xValueMapper:
                                                  (Map<String, double> data,
                                                          _) =>
                                                      data.keys.first,
                                              yValueMapper:
                                                  (Map<String, double> data,
                                                          _) =>
                                                      data.values.first,
                                              dataLabelMapper: (Map<String,
                                                              double>
                                                          data,
                                                      _) =>
                                                  '${data.keys.first}: ${data.values.first}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: dataMap.entries
                                          .map(
                                            (entry) => Column(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: _getColor(entry.key),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(entry.key),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
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
                              dataMap:
                                  dataMap), // Use OverViweCard with dataMap
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FloatingActionButton(
                    onPressed: _openAddExpensesOverlay,
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
      ),
    );
  }

  Color _getColor(String category) {
    switch (category) {
      case 'Food':
        return const Color(0xFF4D79C5); // Use the color from the donut chart
      case 'Travel':
        return const Color.fromARGB(
            255, 197, 77, 77); // Use the color from the donut chart
      case 'Leisure':
        return const Color.fromARGB(
            255, 237, 113, 60); // Use the color from the donut chart
      case 'Work':
        return const Color.fromARGB(
            255, 250, 176, 152); // Use the color from the donut chart
      default:
        return Colors.grey; // Use a default color if category not found
    }
  }
}
