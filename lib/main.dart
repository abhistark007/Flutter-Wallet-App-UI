import 'package:amazing_ui_1/data.dart';
import 'package:amazing_ui_1/widgetswalletheader.dart';
import 'package:flutter/material.dart';

import 'cardsection.dart';
import 'expensesection.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage(),
    theme: ThemeData(
      fontFamily: 'Circular',
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            height: 120,
            child: WalletHeader(),
          ),
          Expanded(child: CardSection(),),
          Expanded(child: ExpenseSection(),),
        ],
      ),
    );
  }
}