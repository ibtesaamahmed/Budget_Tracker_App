import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  // const TransactionItem(
  //     {Key key, required this.transaction, required this.deletetrans})
  //     : super(key: key);
  TransactionItem({
    Key? key,
    required this.transaction,
    required this.deletetrans,
  });

  final Transaction transaction;
  final Function deletetrans;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blueAccent,
      Colors.black,
      Colors.indigo
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              '\$ ' + widget.transaction.amount.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo),
        ),
        subtitle: Text(
          (DateFormat.yMMMd().format(widget.transaction.date)),
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
              color: Color.fromARGB(255, 165, 164, 164)),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () => widget.deletetrans(widget.transaction.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ))
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => widget.deletetrans(widget.transaction.id),
              ),
      ),
    );
  }
}
