import 'package:expence_master/widgets/textstyle.dart';
import 'package:flutter/material.dart';


class PrimaryButtonWidget extends StatelessWidget {
  PrimaryButtonWidget(
      {super.key, required this.mybuttonText, required this.mybuttonFunction});

  late String mybuttonText;
  late VoidCallback mybuttonFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF125A93),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        child: Text(
          mybuttonText,
          style: TextBlueWhiteStyle(),
        ),
        onPressed: mybuttonFunction,
      ),
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  SocialMediaButtons({super.key, this.myIcon, this.myText});

  late Widget? myIcon;
  late String? myText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFBFCFB)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFF868686),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myIcon!,
            SizedBox(
              width: 5.0,
            ),
            Text(
              myText!,
              style: TextRichGrayStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
