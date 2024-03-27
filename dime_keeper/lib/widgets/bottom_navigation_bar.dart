import 'package:expence_master/models/expence.dart';
import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/top_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  // final Database db;
  // final Function(ExpenceModel) onDeleteExpence;
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Expencers();
        break;
      case 1:
        page = TopAppBar();
        break;
      case 2:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('');
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 27, 86, 145),
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_outlined),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings_outlined),
            label: 'Goal',
          )
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
