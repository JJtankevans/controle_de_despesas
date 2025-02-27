import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({required this.recentTransaction, super.key});

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool dayMatch = recentTransaction[i].date.day == weekDay.day;
        bool monthMatch = recentTransaction[i].date.month == weekDay.month;
        bool yearMatch = recentTransaction[i].date.year == weekDay.year;

        if (dayMatch && monthMatch && yearMatch) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children:
            groupedTransactions.map((tr) {
              return Text("${tr["day"]}: ${tr["value"]} | ");
            }).toList(),
      ),
    );
  }
}
