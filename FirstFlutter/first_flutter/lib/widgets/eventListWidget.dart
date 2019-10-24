import 'package:flutter/material.dart';

import '../classes/event.dart';

class EventList extends StatefulWidget {
  final List<Event> events;

  EventList({this.events});

  @override
  _EventListState createState() => _EventListState(events: events);
}

class _EventListState extends State<EventList> {
  // temp data
  List<Event> events;

  _EventListState({this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events.map((event) {
        return  FlatButton(
          splashColor: Colors.amber,
          onPressed: () {
            Navigator.pushNamed(context, "/event", arguments:{'event':event});
            //print("open placeholder ${event.eventName}");
          },
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Image(
                      image: AssetImage("assets/${event.picPath}"),
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
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                          child: Text("${event.getStartDateFormatted()} tot ${event.getEndDateFormatted()}",
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
              FlatButton.icon(
                onPressed: () {
                  setState(() {
                    events.remove(event);
                  });
                },
                label: Text("Verwijder event",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                icon: Icon(Icons.delete, color: Colors.red,size: 20,),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}