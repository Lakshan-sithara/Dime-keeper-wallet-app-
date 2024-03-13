import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final String month = _getMonthName(now.month);
    final String date = _getDateName(now.weekday);
    final String day = now.day.toString();

    return Column(
      children: [
        Text(
          '$date,$month $day',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        // Text('$day',
        //  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        // )
      ],
    );
  }

  String _getDateName(int date) {
    switch (date) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
