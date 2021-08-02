import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:my_transaction/models/transaction.dart';
import 'package:my_transaction/widgets/transaction_form.dart';
import 'package:my_transaction/widgets/transaction_list.dart';
import 'package:my_transaction/widgets/transaction_main.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Mosaic',
              fontWeight: FontWeight.w400,
              fontSize: 20
            )
          )
        )
      ),
      home: MyHomePage('Daily Transaction'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage(this.title);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> transactions = [];


  void _addNewTransaction(String newTitle, double newAmount, DateTime date) {
    final newTransaction = Transaction(
        title: newTitle,
        amount: newAmount,
        date: date,
        id: DateTime.now().toIso8601String());

    var logger = Logger();
    logger.i(newTransaction.toString());
    print(newTransaction);
    setState(() {
      transactions.add(newTransaction);
    });
  }


  var _isChartShown = false;


  void _deleteTransaction(int index){
    setState(() {
      transactions.removeAt(index);
    });
  }

  void _showNewTransactionModel(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TransactionForm(_addNewTransaction),
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(icon: Icon(Icons.add), onPressed: ()  => _showNewTransactionModel(context))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
          child: TransactionMain(transactions, _deleteTransaction, appBar.preferredSize.height)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransactionModel(context),
      ),
    );
  }
}





