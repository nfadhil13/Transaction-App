import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_transaction/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:my_transaction/widgets/transaction_chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> transactionList;

  Chart(this.transactionList);

  var total = 0.0;

  LinkedHashMap<String, double> get transactionChart{
    final mapOfChart = LinkedHashMap<String, double>();
    for( var i = 6; i>-1; i--){
      final weekDay = DateFormat.yMMMEd().format(DateTime.now().subtract(Duration(days: i))).toString();
      mapOfChart[weekDay] = 0.0;
    }
    transactionList.forEach((element) {
      final key = DateFormat.yMMMEd().format(element.date);
      if(mapOfChart.containsKey(key)){
        print("Total $total element total untuk ${element.date} ${element.amount} ");
        total+= element.amount;
        mapOfChart.update(key, (value) => value + element.amount);
      }
    });
    print(mapOfChart);
    return mapOfChart;
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionChart.entries.toList().map((e){
            return Flexible(
                fit: FlexFit.tight,
                child: TransactionChartBar(DateFormat.E().format(DateFormat.yMMMEd().parse(e.key)), e.value, e.value == total ? 1.0 : e.value/total)
            );
          }).toList(),
        ),
      ),
    );
  }
}
