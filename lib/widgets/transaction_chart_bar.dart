import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double percentage;

  TransactionChartBar(this.label, this.spendingAmount, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        child: Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
            SizedBox(height: constraints.maxHeight * 0.04),
            Container(
              width: 10,
              height: constraints.maxHeight * 0.6,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.04),
            Container(height: constraints.maxHeight* 0.15,child: FittedBox(child: Text(label)))
          ],
        ),
      );
    });
  }
}
