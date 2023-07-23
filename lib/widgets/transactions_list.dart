import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transcations;
  final Function deleteTx;
  TransactionList(this.transcations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transactiions!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    opacity: AlwaysStoppedAnimation(0.5),
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transcations
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deletetrans: deleteTx))
                .toList(),
          );
  }
}
