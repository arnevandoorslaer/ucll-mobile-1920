import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/classes/event.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAddExpense extends StatefulWidget {
  @override
  _LoadingAddExpenseState createState() => _LoadingAddExpenseState();
}

class _LoadingAddExpenseState extends State<LoadingAddExpense> {

  Map data = {};
  Event event;

  void getData() async{
    data = ModalRoute.of(context).settings.arguments;
    event = data['event'];

    HttpService.getParticipants(event.eventId).then((List<User> result) =>
        Navigator.pushReplacementNamed(context, '/addexpense', arguments: {'event': event, 'participants': result}))
        .catchError(throw "Failed to get participants for add expense");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: CustomAppBarWidget(text: "Uitgave Toevoegen laden...",),
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