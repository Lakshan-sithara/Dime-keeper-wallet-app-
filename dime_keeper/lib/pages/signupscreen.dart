import 'package:expence_master/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../widgets/buttonstyle.dart';
import '../widgets/textboxstyle.dart';
import '../widgets/textstyle.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          DateFormat('E,MMMM d').format(DateTime.now()),
          style: TextBlackStyleTopNavHeading(),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign in",
                  style: TextRichBlueHeadingStyle(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Email",
                  style: TextGrayStyleLabelHeading(),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: TextBoxStyleBasic(
                    myHintText: "Enter your email",
                  ),
                  // make outline border color gray
                  style: TextStyle(
                    color: Color(0xFF868686),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Password", style: TextGrayStyleLabelHeading()),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: TextBoxStyleBasic(
                      myHintText: "Enter your password",
                      mySuffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.visibility))),
                  // make outline border color gray
                  style: TextStyle(
                    color: Color(0xFF868686),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    // checkbox
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text(
                            "Remember me",
                            style: TextGrayStyleMinorLabel(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Forgot password?",
                        style: TextRichBlueStyle(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                PrimaryButtonWidget(
                  mybuttonText: "Sign in",
                  mybuttonFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationBarApp()));
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextGrayStyleMinorLabel(),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Create now",
                        style: TextRichBlueStyle(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xFF868686),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "or",
                      style: TextGrayStyleMinorLabel(),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xFF868686),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SocialMediaButtons(
                  myIcon: SvgPicture.asset('images/google.svg'),
                  myText: "Sign in with Google",
                ),
                SizedBox(
                  height: 10.0,
                ),
                SocialMediaButtons(
                  myIcon: SvgPicture.asset('images/apple.svg'),
                  myText: "Sign in with Apple",
                ),
                SizedBox(
                  height: 10.0,
                ),
                SocialMediaButtons(
                  myIcon: SvgPicture.asset('images/facebook.svg'),
                  myText: "Sign in with Facebook",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
