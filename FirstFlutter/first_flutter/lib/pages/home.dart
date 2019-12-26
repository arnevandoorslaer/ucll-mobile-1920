import 'package:flutter/material.dart';
import "../classes/user.dart";
import "../classes/event.dart";
import '../widgets/listHeader.dart';
import '../widgets/eventListWidget.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<Event> events= [];
  List<User> users= [];

  @override
  Widget build(BuildContext context) {
    // vul die map aan
    data = ModalRoute.of(context).settings.arguments;
    events = data['events'];
    users = data['participants'];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBarWidget(text: "Event Manager",),
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
                    onPressed: () {Navigator.pushNamed(context, "/login");},
                    child: Row(
                      children: <Widget>[
                        Text("Login",
                          style: TextStyle(
                            color: Color(0xff00285A),
                          ),
                        ),
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
          onPressed: () {Navigator.pushNamed(context, "/add", arguments: {'participants': this.users});},
          child: Icon(Icons.add, size: 40,),
          foregroundColor: Color(0xff00285A),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}