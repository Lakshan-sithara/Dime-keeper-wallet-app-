import 'package:flutter/material.dart';

class OverViweCard extends StatelessWidget {
  final Map<String, double> dataMap;
  const OverViweCard({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Last Record Overview',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'LAST 30 DAYS',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //###### Food ######
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.restaurant_menu_outlined,
                    color: Colors.red,
                  ),
                  const Text(
                    'Food',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text('${dataMap['Food']}'), // Display food data from dataMap
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //###### Travel ######
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.directions_transit,
                    color: Colors.blue,
                  ),
                  const Text(
                    'Travel',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      '${dataMap['Travel']}'), // Display travel data from dataMap
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //###### Leisure ######
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.greenAccent,
                  ),
                  const Text(
                    'Leisure',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      '${dataMap['Leasure']}'), // Display leisure data from dataMap
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //###### Work ######
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.work_outlined,
                    color: Color.fromARGB(185, 254, 254, 41),
                  ),
                  const Text(
                    'Work',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text('${dataMap['Work']}'), // Display work data from dataMap
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
