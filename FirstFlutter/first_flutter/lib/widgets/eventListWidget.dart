import 'package:flutter/material.dart';

import '../classes/event.dart';

class EventList extends StatefulWidget {
  final List<Event> events;

  EventList({this.events});

  @override
  _EventListState createState() => _EventListState(events: events);
}

class _EventListState extends State<EventList> {
  List<Event> events;
  _EventListState({this.events});

  @override
  Widget build(BuildContext context) {

    Column column;
    if(events.isNotEmpty){
      column = Column(
        children: events.map((event) {
          return  FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              Navigator.pushNamed(context, "/loadingevent", arguments:{'event':event});
              //print("open placeholder ${event.eventName}");
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: new FadeInImage(
                        placeholder: NetworkImage('https://i.imgur.com/WqRXc6V.jpg'),
                        image: NetworkImage("${event.picPath}"),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                            child: Text("${event.eventName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                            child: Text("${event.startDate}\nDeelnemers: ${event.participants.length}",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.white70, height: 20,),
              ],
            ),
          );
        }).toList(),
      );
    }
    else
      {
        TextStyle stijl = TextStyle(fontSize: 16, );
        column = Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Je bent geen lid van een evenement!",
                style: stijl,
                textAlign: TextAlign.center,
              ),
            ),
            Image(
              image: AssetImage("assets/sad.png"),
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Maak je eigen evenement aan of wordt toegevoegd aan een evenement"
                  " door iemand anders!",
                style: stijl,
              textAlign: TextAlign.center,),
            ),
          ],
        );
      }

    return column;
  }
}