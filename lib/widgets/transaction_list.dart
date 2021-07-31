import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((transaction) => Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '\$${transaction.amount.toString()}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Text(
                              DateFormat('EEE, d MMM y')
                                  .format(transaction.date),
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
