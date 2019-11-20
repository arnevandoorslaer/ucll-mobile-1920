import 'dart:ffi';
import 'dart:ui';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import "../classes/event.dart";
import "../classes/user.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';


class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Map data = {};
  Event event;
  List<dynamic> participants;
  String cost = "loading...";
  bool done = false;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    event = data['event'];
    double screenHeight = MediaQuery.of(context).size.height;
    participants = event.participants;
    HttpService.getCostOfEvent(event.eventId).then((String res) {
      if(!done) {
        setState(() {
          cost = res;
        });
        done = true;
      }
    });

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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "${event.startDate}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
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
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                ),

                                Text(
                                    "${event.endDate}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 13,
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

                    Card( //omschrijving----------------------------------------
                      color: Colors.grey[800],
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                  "Omschrijving",
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

                    Padding( // DEELNEMER KNOP =======================
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                      child: RaisedButton.icon(
                        splashColor: Colors.amber,
                        color: Colors.grey[800],
                        onPressed: () {
                              Navigator.pushNamed(context, '/loadingparticipants', arguments: {'id': event.eventId});
                        },
                        icon: Icon(Icons.list, color: Colors.white, size: 40,),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text("${participants.length} Deelnemers",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding( // GELDJES KNOP =======================
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                      child: RaisedButton.icon(
                        splashColor: Colors.amber,
                        color: Colors.grey[800],
                        onPressed: () {
                          Navigator.pushNamed(context, '/loadingexpenses', arguments: {'id': event.eventId});
                        },
                        icon: Icon(Icons.list, color: Colors.white, size: 40,),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Totale kost:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  decoration: TextDecoration.none,
                                ),),
                              Text("€ ${cost.toString()}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Card( //map-------------------------------------------------
                      color: Colors.grey[800],
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("${event.location}",
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Container(
                              height: 400,
                              width: 400,
                              child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(48.066853, 12.863487),
                                  zoom: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: FlatButton.icon(
                        color: Colors.red[200],
                        onPressed: () {

                        },
                        label: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Verwijder event",
                            style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 16,
                            ),
                          ),
                        ),
                        icon: Icon(Icons.delete, color: Colors.red[900],size: 25,),
                      ),
                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
