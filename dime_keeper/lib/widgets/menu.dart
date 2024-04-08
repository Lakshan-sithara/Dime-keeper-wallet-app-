import 'package:expence_master/pages/Goals.dart';
import 'package:expence_master/pages/expencers.dart';
import 'package:expence_master/pages/profilescreen.dart';
import 'package:expence_master/pages/signupscreen.dart';
import 'package:expence_master/widgets/bottom_navigation_bar.dart';
import 'package:expence_master/widgets/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              const Text("Hi Selina"),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                  "“Small amounts saved daily add up to hugeinvestments in the end.” – Margo Vader"),
              const SizedBox(
                height: 10.0,
              ),
              //profile gesture detector
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF696767),
                    ),
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Profile")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // account gesture detector
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationBarApp(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF696767),
                    ),
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.assessment),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Account")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // budget gesture detector
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopAppBar(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF696767),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Budget")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalsPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF696767),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.savings),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Goals")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(0xFF696767),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Settings")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF696767),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Sign out")
                      ],
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
}
