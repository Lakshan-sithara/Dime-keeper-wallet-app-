import 'package:expence_master/models/expence.dart';
import 'package:expence_master/pages/budget.dart';
import 'package:expence_master/pages/budget_income.dart';
import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AppBarTitleWithDateTime.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';

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
        page = Expence();
        break;
      case 1:
        page = Income();
        break;
      default:
        throw UnimplementedError('');
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 163, 237, 249),
          title: const Center(child: DateWidget()),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Expense',
              ),
              Tab(
                text: 'Income',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [Expence(), Income()]),
        backgroundColor: const Color.fromARGB(255, 163, 237, 249),
      ),
    );
  }
}
