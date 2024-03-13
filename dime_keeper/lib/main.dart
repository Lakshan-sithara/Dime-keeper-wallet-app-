import "package:expence_master/models/expence.dart";
//import "package:expence_master/pages/expencers.dart";
import "package:expence_master/server/categary_adapter.dart";
import "package:expence_master/widgets/bottom_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:hive_flutter/adapters.dart";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenceModelAdapter());
  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox('expenceDatabase');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarApp(),
    );
  }
}
