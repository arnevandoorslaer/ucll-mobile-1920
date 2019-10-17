import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import "../classes/event.dart";

class EventScreen extends StatefulWidget {
  final Event event;

  EventScreen({this.event});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[

        Container( //Main window------------------------------------------------
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bbc4.PNG"),
              fit: BoxFit.cover,
            ),
          ),

          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: ListView(
                  padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                  children: <Widget>[
  
                    Card( //omschrijving----------------------------------------
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
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  )
                              ),
                            ),
  
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar, augue at consectetur vestibulum, est lectus condimentum lectus, nec pellentesque massa ante eget lectus. Morbi ut turpis velit. Ut ante leo, commodo eu commodo et, ullamcorper quis nunc. Vivamus velit purus, interdum ac mi vitae, cursus aliquet eros. Aenean quis enim sit amet massa posuere gravida.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
  
                    Card( //deelnemers------------------------------------------
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    "Deelnemers",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
  
                                Text(
                                  "Obama Obama",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
  
                                Text(
                                  "Malicious User",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
  
                                Text(
                                  "Steve van Minecraft enal enzo dit is een test op lange naam",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ]
                          )
                      ),
                    ),
  
                    Card( //map-------------------------------------------------
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                                "Locatie",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
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

                    Row( //datums-----------------------------------------------
                      children: <Widget>[

                        Card(
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
                                        color: Colors.black,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "01/01/2000",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
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
                                        color: Colors.black,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "01/01/2000",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
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
  
                  ],
                )
            ),
          ),
        ),

        new Positioned( //Navbar------------------------------------------------
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text('Evenement Naam'),
            backgroundColor: Colors.transparent, //Transparent
            elevation: 0, //Shadow gone
          ),
        ),

      ],
    );
  }
}
