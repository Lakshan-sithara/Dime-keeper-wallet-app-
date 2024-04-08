import 'package:expence_master/pages/chooseprofilepic.dart';
import 'package:expence_master/widgets/textboxstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expence_master/widgets/menu.dart';
import '../widgets/textstyle.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SliderDrawer(
        appBar: SliderAppBar(
            appBarColor: const Color(0xFFC9EDF7),
            title: Text(
              "Profile",
              style: TextBlackStyleTopNavHeading(),
            ),
            trailing: IconButton(
              onPressed: Navigator.of(context).pop,
              icon:
                  const Icon(Icons.check), // Wrap Icons.check with Icon widget
              color: Colors.black,
            )),
        slider: Menu(),
        child: Container(
          color: Color(0xFFDFF8FF),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProfilePicScreen();
                          }));
                        },
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('images/profile.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "First name",
                      style: TextGrayStyleLabelHeading(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: TextBoxStyleBasic(myHintText: "Selina"),
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Last name",
                      style: TextGrayStyleLabelHeading(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: TextBoxStyleBasic(myHintText: "De Silva"),
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Date of birth",
                      style: TextGrayStyleLabelHeading(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration:
                          TextBoxStyleBasic(myHintText: "00 / 00 / 0000"),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Email",
                      style: TextGrayStyleLabelHeading(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration:
                          TextBoxStyleBasic(myHintText: "abc@gmail.com"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
