import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onDelete;

  const TransactionItem({super.key, required this.tr, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                "R\$${tr.value.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(tr.title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          DateFormat("d MMM y").format(tr.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing:
            MediaQuery.of(context).size.width > 480
                ? TextButton.icon(
                  onPressed: () => onDelete(tr.id),
                  icon: const Icon(Icons.delete),
                  label: const Text("Excluir"),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                )
                : IconButton(
                  onPressed: () => onDelete(tr.id),
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                ),
      ),
    );
  }
}
