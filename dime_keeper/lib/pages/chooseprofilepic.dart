import 'package:expence_master/widgets/menu.dart';
import 'package:expence_master/widgets/textboxstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:intl/intl.dart';

import '../widgets/textstyle.dart';

class ProfilePicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SliderDrawer(
          appBar: SliderAppBar(
            appBarColor: Color(0xFFC9EDF7),
            title: Text(
              "Choose Profile Picture",
              style: TextBlackStyleTopNavHeading(),
            ),
          ),
          slider: Menu(),
          child: Container(
            color: Color(0xFFDFF8FF),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/pic1.png'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: AssetImage('images/pic2.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/pic3.png'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: AssetImage('images/pic4.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/pic5.png'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: AssetImage('images/pic6.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/pic7.png'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: AssetImage('images/pic8.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
