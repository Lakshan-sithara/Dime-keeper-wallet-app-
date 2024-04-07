import "package:expence_master/models/expence.dart";
import "package:expence_master/pages/chooseprofilepic.dart";
import "package:expence_master/pages/onboardingscreen.dart";
import "package:expence_master/pages/profilescreen.dart";
import "package:expence_master/pages/register.dart";
import "package:expence_master/pages/signupscreen.dart";
import "package:expence_master/pages/splashscreen.dart";

import "package:expence_master/server/categary_adapter.dart";
import "package:expence_master/widgets/bottom_navigation_bar.dart";

import "package:flutter/material.dart";
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
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/onbording': (context) => OnBoardinScreen(),
        '/signup': (context) => SignInScreen(),
        '/register': (context) => SignUpScreen(),
        '/dashboard': (context) => BottomNavigationBarApp(),
        '/editprofile': (context) => ProfileScreen(),
        '/changeprofilepic': (context) => ProfilePicScreen(),
      },
      initialRoute: '/onbording',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFDFF8FF),
        colorSchemeSeed: Color(0xFF125A93),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
