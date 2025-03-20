import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  const TransactionList({
    required this.transactions,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.1,
                  child: Text(
                    "Nenhuma Transação Cadastrada!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        )
        : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return LayoutBuilder(
              builder: (context, constraints) {
                return TransactionItem(
                  key: GlobalObjectKey(tr),
                  tr: tr,
                  onDelete: onDelete,
                );
              },
            );
          },
        );
  }
}
