import 'package:flutter/material.dart';

import "../classes/event.dart";
import '../classes/tempTestData.dart';
import '../classes/user.dart';
import '../widgets/listHeader.dart';
import '../widgets/eventListWidget.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Event> events = TempTestData.getEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBarWidget(),
      body: ListView(
        children: <Widget>[
          ListHeader(text: "Aangemeld als:",),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                  child: Text(
                    "Niet aangemeld!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: ButtonTheme(
                  minWidth: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Text("Login"),
                        Icon(
                          Icons.person,
                          color: Color(0xff00285A),
                          size: 30,
                        ),
                      ],
                    ),
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
          ListHeader(text: "Mijn evenementen:",),
          EventList(events: this.events,),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
        child: FloatingActionButton(
          onPressed: () {
            print("floating button pressed");
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
          foregroundColor: Color(0xff00285A),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}