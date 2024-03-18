import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
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
        page = Placeholder();
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
        body: TabBarView(children: [Placeholder(), Placeholder()]),
      ),
    );
  }
}
