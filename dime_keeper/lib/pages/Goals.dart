import 'package:expence_master/models/Goal.dart';
import 'package:expence_master/models/Plan.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/add_new_goals.dart';
import 'package:expence_master/widgets/add_new_monthly_plans.dart';
import 'package:expence_master/widgets/goal_list.dart';
import 'package:expence_master/widgets/menu.dart';
import 'package:expence_master/widgets/plan_list.dart';
import 'package:expence_master/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  //goal list
  final List<GoalModel> _goals = [
    GoalModel(title: "Phone", date: DateTime.now(), progress: 10, target: 100),
    GoalModel(title: "Trip", date: DateTime.now(), progress: 20, target: 100),
    GoalModel(title: "food", date: DateTime.now(), progress: 50, target: 100)
  ];

  //plan list
  final List<PlanModel> _plans = [
    PlanModel(title: "electric bill", date: DateTime.now(), amount: 1000)
  ];

  //add new goal
  void AddNewGoal(GoalModel goal) {
    setState(() {
      _goals.add(goal);
    });
  }

  //add new plan
  void onAddPlan(PlanModel plan) {
    setState(() {
      _plans.add(plan);
    });
  }

  //remove goal
  void _handleDeleteGoal(GoalModel goal) {
    setState(() {
      _goals.remove(goal);
    });
  }

  //remove plan
  void _onDeletePlan(PlanModel plan) {
    setState(() {
      _plans.remove(plan);
    });
  }

  //function to open goal model overlay
  void _openaddGoalsOverlay() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: AddNewGoals(addNewGoal: AddNewGoal),
          ),
        ));
  }

  //function to open paln model overlay
  void _openPlanOverlay() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: AddPlan(onAddPlan: onAddPlan),
                )));
  }

  //update Add Goal values
  void _updateGoalProgress(GoalModel goal, double amount) {
    setState(() {
      // Find the goal in the list and update its progress
      final index = _goals.indexOf(goal);
      if (index != -1) {
        _goals[index].progress += amount.toInt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      appBar: SliderAppBar(
        appBarColor: Color(0xFFC9EDF7),
        title: Text(
          "Dashbord",
          style: TextBlackStyleTopNavHeading(),
        ),
      ),
      slider: Menu(),
      child: Container(
        color: const Color(0xFFDFF8FF),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Goal',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //goals container
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Icon(
                                Icons.savings_outlined,
                                size: 50,
                                color: Colors.pink[400],
                              ),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Goal',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('How much you want to save?')
                            ],
                          )
                        ],
                      ),
                      GoalList(
                        goalList: _goals,
                        onDeleteGoal: _handleDeleteGoal,
                        onAddGoal: _updateGoalProgress,
                      ),
                      ElevatedButton(
                        onPressed: _openaddGoalsOverlay,
                        child: const Text('Add New Goal'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //monthly playment container
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Icon(
                                Icons.touch_app_outlined,
                                size: 50,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Planed Payment',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Plan your mounthly payment')
                            ],
                          )
                        ],
                      ),
                      PlanList(
                        planList: _plans,
                        onDeletePlan: _onDeletePlan,
                      ),
                      ElevatedButton(
                        onPressed: _openPlanOverlay,
                        child: const Text('Add New Plan'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
