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


// Card(
//                   child: Row(children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       padding: EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Theme.of(context).primaryColor, width: 3)),
//                       child: Text(
//                         '\$' + txn[index].amount.toStringAsFixed(2),
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             txn[index].title,
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(txn[index].date),
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ]),
//                 );