import 'package:Cleverdivide/classes/expense.dart';
import 'package:Cleverdivide/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatefulWidget {
  @override
  _ExpensesListState createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  Map data = {};
  List<Expense> expenses = [];

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    expenses = data['expenses'];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBarWidget(text: "Uitgaven",),
      body: ListView(
        children: expenses.map((expense) {
          return Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${expense.description}",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                  Text("€${expense.amount}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
