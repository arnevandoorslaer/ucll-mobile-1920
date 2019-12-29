import 'package:Cleverdivide/pages/participantList.dart';
import 'package:Cleverdivide/pages/loadingParticipants.dart';
import 'package:Cleverdivide/pages/loadingEvent.dart';
import 'package:Cleverdivide/pages/addParticipants.dart';
import 'package:Cleverdivide/pages/loadingAddParticipants.dart';
import 'package:Cleverdivide/pages/loadingExpenses.dart';
import 'package:Cleverdivide/pages/expensesList.dart';
import 'package:Cleverdivide/pages/addExpense.dart';
import 'pages/addEvent.dart';
import 'pages/loading.dart';
import 'pages/loginScreen.dart';
import 'pages/registerScreen.dart';
import 'package:flutter/material.dart';
import 'pages/eventScreen.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => Loading(),
    "/home" : (context) => Home(),
    "/add" : (context) => AddEvent(),
    "/login" : (context) => LoginScreen(),
    "/event" : (context) => EventScreen(),
    "/register" : (context) => RegisterScreen(),
    "/participants" : (context) => ParticipantList(),
    "/loadingparticipants" : (context) => LoadingParticipants(),
    "/loadingevent" : (context) => LoadingEvent(),
    "/loadingaddparticipants" : (context) => LoadingAddParticipants(),
    "/addparticipants" : (context) => AddParticipants(),
    "/loadingexpenses" : (context) => LoadingExpenses(),
    "/expenses" : (context) => ExpensesList(),
    "/addexpense" : (context) => AddExpense(),
  },
  theme: ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    toggleableActiveColor: Color(0xff00285A),
  ),
));
