import 'package:flutter/material.dart';

import "../classes/event.dart";
import '../widgets/listHeader.dart';
import '../widgets/eventListWidget.dart';
import '../widgets/appbar.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: CustomAppBarWidget(text: "Event"),
      body: ListView(
       children: <Widget>[
         ListHeader(
           Row(
             children: <Widget>[
               Text("Eventname placeholder"),
               Text("StartDate placeholder"),
               Text("EndDate placeholder"),
             ]
           )
         ),
       ]
      )
    );
  }
}