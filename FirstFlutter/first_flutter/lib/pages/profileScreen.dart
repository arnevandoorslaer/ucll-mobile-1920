import 'dart:html';

import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }
  Map data = {};
  List<Event> events= [];
  List<User> users= [];
  String username;

  @override
  Widget build(BuildContext context) {
    // vul die map aan
    data = ModalRoute.of(context).settings.arguments;
    events = data['events'];
    users = data['participants'];
    username = data['username'];

    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Profiel"),
          backgroundColor: Color(0xff00285A),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/loadingProfile");
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
        body:ListView(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'EPISCHE PROFIEL PAGINA VAN "$username"',
              ),
            )
          ],
        )
    );
  }
}
