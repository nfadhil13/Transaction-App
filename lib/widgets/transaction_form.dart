import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) addNewTransaction;


  TransactionForm(this.addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? selectedDate;

  void _submitTransaction(){
      final title = titleController.text;
      final double? amount = double.tryParse(amountController.text);
      if(title.isNotEmpty && amount != null && selectedDate != null){
        widget.addNewTransaction(title, amount, selectedDate!);
        Navigator.of(context).pop();
      }
  }

  void _showDatePicker(ctx){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year), lastDate: DateTime.now())
    .then((value) => {
      this.setState(() {
        selectedDate = value;
      })
    });
  }

  String getCurrentDateString() {
    if(selectedDate != null){
      return  DateFormat.yMMMMd().format(selectedDate!);
    }else{
      return "No Date Picked";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitTransaction(),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitTransaction(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10),
                  Text(getCurrentDateString() , style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),),
                  SizedBox(width: 4),
                  TextButton(onPressed: () => _showDatePicker(context), child: Text("Pick a Date"))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _submitTransaction,
                child: Text(
                  "Add Transaction"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
