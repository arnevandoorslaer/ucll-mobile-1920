import 'package:Cleverdivide/widgets/createExpenseForm.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(text: "Uitgave Toevoegen",),
      backgroundColor: Colors.grey[900],
      body: CreateExpenseForm(),
    );
  }
}
