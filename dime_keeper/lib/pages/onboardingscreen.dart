import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:dime_keeper/widgets/onboardingcontent.dart';

import 'package:expandable_page_view/expandable_page_view.dart';

import '../models/onboardingcontent.dart';
import '../widgets/buttonstyle.dart';
import '../widgets/textstyle.dart';

class OnBoardinScreen extends StatefulWidget {
  OnBoardinScreen({super.key});

  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  late List<OnboardingCotent> content;
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    content = OnboardingCotent.getContent();
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFF8FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ExpandablePageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: content.length,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [SvgPicture.asset(content[i].image)],
                    );
                  }),
              PrimaryButtonWidget(
                mybuttonText:
                    currentIndex == content.length - 1 ? "Get Started" : "Next",
                mybuttonFunction: () {
                  if (currentIndex == content.length - 1) {
                    Navigator.pushNamed(context, '/signup');
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
              ),
              Text(
                currentIndex == content.length - 1 ? "" : "Skip",
                style: TextRichBlueStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
