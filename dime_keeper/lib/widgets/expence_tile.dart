import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  expence.amount.toStringAsFixed(2),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categaryIcons[expence.categary]),
                    const SizedBox(width: 8),
                    Text(expence.getFormattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
