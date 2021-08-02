import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_transaction/widgets/transaction_empty.dart';
import 'package:my_transaction/widgets/transaction_item.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) onDeleteTransaction;
  TransactionList(this.transactions, this.onDeleteTransaction);

  @override
  Widget build(BuildContext context) {
    return  transactions.isNotEmpty ? ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(transactions[index], () => onDeleteTransaction(index) );
        },
        itemCount: transactions.length,
      ) : TransactionEmpty();
  }
}


