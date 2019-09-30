import 'package:flutter/material.dart';
import "event.dart";
import 'tempTestData.dart';
import 'eventListWidget.dart';

void main() => runApp(MaterialApp(
  home : HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(
            child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/vsv1.png"),
                    width: 60,
                    height: 60,
                  ),
                  Text("VSV Event Manager")
                ],
            ),
        ),
        backgroundColor: Color(0xff00285A),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[850],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Aangemeld als:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
            ),
          ),
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
                        Text(
                          "Login"
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
          Container(
            color: Colors.grey[850],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Mijn evenementen:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
            ),
          ),
          EventList(),
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




