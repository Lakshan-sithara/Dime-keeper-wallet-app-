import 'package:expence_master/models/expence.dart';
import 'package:expence_master/pages/budget.dart';
import 'package:expence_master/pages/budget_income.dart';
import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:expence_master/widgets/menu.dart';
import 'package:expence_master/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class TopAppBar extends StatefulWidget {
  // final Database db;
  // final Function(ExpenceModel) onDeleteExpence;
  const TopAppBar({super.key});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentIndex) {
      case 0:
        page = Income();
        break;
      case 1:
        page = Expence();
        break;
      default:
        throw UnimplementedError('');
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
            title: Text(
              "Dashboard",
              style: TextBlackStyleTopNavHeading(),
            ),
            appBarColor: Color(0xFFC9EDF7),
          ),
          slider: Menu(),
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                Container(
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: 'Income',
                      ),
                      Tab(
                        text: 'Expense',
                      ),
                    ],
                  ),
                ),
                Container(
                    color: const Color(0xFFDFF8FF),
                    height: MediaQuery.of(context).size.height,
                    child: const TabBarView(children: [Income(), Expence()])),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
