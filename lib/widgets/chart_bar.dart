import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String labels;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.labels, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\$' + spendingAmount.toStringAsFixed(0),
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            )),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20))),
              FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                  )),
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                labels,
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ),
        ],
      );
    });
  }
}
