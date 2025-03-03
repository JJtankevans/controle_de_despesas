import 'package:expenses/components/chart_bar.dart';
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

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, transaction) {
      return sum + (transaction["value"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              groupedTransactions.map((tr) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: tr["day"].toString(),
                    value: tr["value"] as double,
                    percentage: (tr["value"] as double) / _weekTotalValue,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
