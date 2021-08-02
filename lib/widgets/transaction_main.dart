import 'package:flutter/material.dart';
import 'package:my_transaction/models/transaction.dart';
import 'package:my_transaction/widgets/transaction_chart.dart';
import 'package:my_transaction/widgets/transaction_list.dart';


class TransactionMain extends StatefulWidget {

  final List<Transaction> transactions;
  final Function(int) onDeleteTransaction;
  final double appBarHeight;
  TransactionMain(this.transactions, this.onDeleteTransaction, this.appBarHeight);

  @override
  _TransactionMainState createState() => _TransactionMainState();
}

class _TransactionMainState extends State<TransactionMain> {

  var _shouldShowChart = false;

  @override
  Widget build(BuildContext context) {
    final isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if(!isPotrait) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Show Chart"),
              Switch(value: _shouldShowChart, onChanged: (value) {
                setState(() {
                  _shouldShowChart = value;
                });
              })
            ],
          ),
          if(isPotrait || _shouldShowChart) Container(
            height: (MediaQuery.of(context).size.height - widget.appBarHeight - MediaQuery.of(context).padding.top) * (isPotrait ? 0.25 : 0.7),
            child: Card(
              child: Container(
                  color: Colors.lightBlueAccent,
                  width: double.infinity,
                  child: Chart(widget.transactions)),
              elevation: 5,
            )
          ),
          if(isPotrait || !_shouldShowChart) Container(
            height: ((MediaQuery.of(context).size.height - widget.appBarHeight - MediaQuery.of(context).padding.top) * (isPotrait ? 0.7 : 0.95 ) ) - 10,
            margin: EdgeInsets.only(top: 10),
            child:  TransactionList(widget.transactions, widget.onDeleteTransaction),
          )
        ],
      ),
    );
  }
}


