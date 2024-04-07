import 'package:expence_master/pages/profilescreen.dart';
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
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Text("Hi Selina"),
              SizedBox(
                height: 10.0,
              ),
              Text(
                  "“Small amounts saved daily add up to hugeinvestments in the end.” – Margo Vader"),
              SizedBox(
                height: 10.0,
              ),
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
                      color: Color(0xFF696767),
                    ),
                  ),
                  child: Padding(
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF696767),
                  ),
                ),
                child: Padding(
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF696767),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF696767),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF696767),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF696767),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
