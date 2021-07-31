import 'package:flutter/material.dart';
import 'package:my_transaction/models/transaction.dart';
import 'package:my_transaction/widgets/transaction_form.dart';
import 'package:my_transaction/widgets/transaction_list.dart';

class TransactionMain extends StatefulWidget {
  @override
  _TransactionMainState createState() => _TransactionMainState();
}

class _TransactionMainState extends State<TransactionMain> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 67.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Home', amount: 69.9, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TransactionList(transactions),
        )
      ],
    );
  }

  void _addNewTransaction(String newTitle, double newAmount) {
    final newTransaction = Transaction(
        title: newTitle,
        amount: newAmount,
        date: DateTime.now(),
        id: DateTime.now().toIso8601String());

    setState(() {
      transactions.add(newTransaction);
    });
  }
}
