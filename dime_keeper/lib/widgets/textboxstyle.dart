import 'package:flutter/material.dart';

InputDecoration TextBoxStyleBasic(
    {String? myHintText, Widget? mySuffixIcon, Widget? myPrefixIcon}) {
  return InputDecoration(
    prefixIcon: myPrefixIcon,
    suffixIcon: mySuffixIcon,
    hintText: myHintText,
    // add borders
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Color(0xFFCBCBCB),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 3.0,
        color: Color(0xFF125A93),
      ),
    ),
    // background color white
    fillColor: Color(0xFFFBFCFB),
    filled: true,
  );
}
