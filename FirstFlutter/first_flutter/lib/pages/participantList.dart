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
    users.sort((a, b) => a.getFirstName().compareTo(b.getUserName()));

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBarWidget(text: "Deelnemers",),
      body: ListView(
        children: users.map((user) {
          return Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 6,
                    child: Text("${user.name} ${user.surName}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text("${user.userName}",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
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
