
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';



class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function onTransactionDelete;

  TransactionItem(this.transaction, this.onTransactionDelete);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: Text("\$${transaction.amount.toStringAsFixed(2)}"),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          subtitle: Text(
            "${DateFormat.yMMMMd().format(transaction.date)}",
            style: TextStyle(
              fontSize: 12
            ),
          ),
          trailing: IconButton(
            onPressed: () => onTransactionDelete(),
            icon: Icon(
                Icons.delete,
                color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}