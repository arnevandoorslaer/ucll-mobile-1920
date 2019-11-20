import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ParticipantList extends StatefulWidget {
  @override
  _ParticipantListState createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  Map data = {};
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    users = data['users'];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBarWidget(text: "Deelnemers",),
      body: ListView(
        children: users.map((user) {
          
        }).toList(),
      ),
    );
  }
}
