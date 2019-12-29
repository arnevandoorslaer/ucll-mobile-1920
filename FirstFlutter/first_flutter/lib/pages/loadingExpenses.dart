import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/expense.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingExpenses extends StatefulWidget {
  @override
  _LoadingExpensesState createState() => _LoadingExpensesState();
}

class _LoadingExpensesState extends State<LoadingExpenses> {

  Map data = {};
  int id;

  void getData() async{
    data = ModalRoute.of(context).settings.arguments;
    id = data['id'];

    HttpService.getExpenses(id).then((List<Expense> result) =>
        Navigator.pushReplacementNamed(context, '/expenses',
            arguments: {'expenses': result}))
        .catchError(throw "Failed to get expenses");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: CustomAppBarWidget(text: "Uitgaven laden...",),
      body: Center(
        child: SpinKitRing(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}



