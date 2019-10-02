import 'package:flutter/material.dart';

import "../classes/event.dart";
import '../classes/tempTestData.dart';
import '../classes/user.dart';
import '../widgets/listHeader.dart';
import '../widgets/eventListWidget.dart';
import '../widgets/appbar.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: Text("Dit is add schermpie"),
    );
  }
}
