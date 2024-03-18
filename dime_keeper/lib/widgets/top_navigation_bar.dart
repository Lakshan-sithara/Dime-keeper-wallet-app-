import 'package:expence_master/models/expence.dart';
import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  final Database db;
  final Function(ExpenceModel) onDeleteExpence;
  const TopAppBar({super.key,required this.db,required this.onDeleteExpence});

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
        page = ExpenceList(
          expenceList: widget.db.expenceList,
          onDeleteExpence: widget.onDeleteExpence,
        );
        break;
      case 1:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('');
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
        body: TabBarView(children: [page, Placeholder()]),
      ),
    );
  }
}
