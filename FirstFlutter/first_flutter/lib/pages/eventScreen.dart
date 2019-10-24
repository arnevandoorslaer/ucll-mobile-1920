import 'dart:ui';
import 'package:flutter/material.dart';
import "../classes/event.dart";
import "../classes/user.dart";

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Map data = {};
  Event event;
  List<User> participants;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    event = data['event'];
    double screenHeight = MediaQuery.of(context).size.height;
    participants = event.participants;

    return new Scaffold(
      backgroundColor: Colors.grey[900],
      body: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Color(0xff00285A),
            expandedHeight: 180.0,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: new FlexibleSpaceBar(
              title: Text(
                "${event.eventName}",
                style: TextStyle(
                  shadows: [Shadow(color: Colors.black, blurRadius: 8)],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              background: new Image.asset("assets/${event.picPath}",
                  fit: BoxFit.cover),
            ),
          ),
          new SliverPadding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: screenHeight/3),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                  [

                    Row( //datums-----------------------------------------------
                      children: <Widget>[

                        Card(
                          color: Colors.grey[800],
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                      "Van",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "${event.getStartDateFormatted()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),

                        Card(
                          color: Colors.grey[800],
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                      "Tot",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "${event.getEndDateFormatted()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                    Card( //deelnemers------------------------------------------
                      color: Colors.grey[800],
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    "Deelnemers",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),

                                Column(
                                  children: participants.map((user) {
                                    //foute alignment, fucking dark magic
                                      return Text("${user.getName()}",
                                       textAlign: TextAlign.left,
                                       style: TextStyle(
                                         fontSize: 15,
                                         color: Colors.white70,
                                         fontFamily: 'Helvetica',
                                         fontWeight: FontWeight.normal,
                                         decoration: TextDecoration.none,
                                       ),
                                       overflow: TextOverflow.ellipsis,
                                       maxLines: 1,
                                    );
                                  }).toList(),
                                ),

                              ]
                          )
                      ),
                    ),

                    Card( //map-------------------------------------------------
                      color: Colors.grey[800],
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                                "Locatie",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                )
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Image(
                              image: AssetImage("assets/IMG_4085.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Card( //omschrijving----------------------------------------
                      color: Colors.grey[800],
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                  "Evenement Omschrijving",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),

                            Text(
                                "${event.extraInfo}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),

                  ]
              ),
            ),
          ),

        ],
      ),
    );
  }
}
