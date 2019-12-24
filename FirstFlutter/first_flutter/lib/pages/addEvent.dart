import 'package:Cleverdivide/widgets/aanmaakForm.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(text: "Event Maken",),
      backgroundColor: Colors.grey[900],
      body: AanmaakForm(),
    );
  }
}
