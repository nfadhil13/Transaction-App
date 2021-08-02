import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
          child: Column(
            children: [
              Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/image/waiting.png')
              ),
              Padding(padding: EdgeInsets.only(top: 10), child: Text("You have no transaction"),)
            ],
          )
      );
    });
  }
}
