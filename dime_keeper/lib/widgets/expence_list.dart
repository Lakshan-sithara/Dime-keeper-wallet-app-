import 'package:expence_master/models/expence.dart';
import 'package:expence_master/widgets/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
 final List<ExpenceModel> expenceList;
 final void Function(ExpenceModel expence) onDeleteExpence;
 const ExpenceList({
    Key? key,
    required this.expenceList,
    required this.onDeleteExpence,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenceList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Dismissible(
            key: ValueKey(expenceList[index]),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              onDeleteExpence(expenceList[index]);
            },
            child: ExpenceTile(
              expence: expenceList[index],
            ),
          ),
        );
      },
    );
 }
}
