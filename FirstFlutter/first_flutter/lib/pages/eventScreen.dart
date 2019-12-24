import 'dart:ui';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import "../classes/event.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location_permissions/location_permissions.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  //google mapke hier hier hier-------------------------------------------------
  GoogleMapController mapController;
  double lat;
  double long;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Map data = {};
  Event event;
  List<dynamic> participants;
  String cost = "loading...";
  bool done = false;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    event = data['event'];
    Coordinates coordinates = data['coordinates'];
    lat = coordinates.latitude;
    long = coordinates.longitude;
    double screenHeight = MediaQuery.of(context).size.height;
    participants = event.participants;

    HttpService.getCostOfEvent(event.eventId).then((String res) {
      if(!done) {
        setState(() {
          RegExp exp = new RegExp(r"(\d+\.\d{0,1})");
          String str = res;
          var matches = exp.allMatches(str);
          cost = matches.elementAt(0).group(0);
        });
        done = true;
      }
    });

    var markerIdVal = this.event.location;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(this.lat, this.long),
      infoWindow: InfoWindow(title: markerIdVal),
    );

    setState(() {
      markers[markerId] = marker;
    });

    return new Scaffold(
      backgroundColor: Colors.grey[900],
      body: Builder(
        builder: (context) =>
        new CustomScrollView(
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
                background: new FadeInImage(
                    placeholder: NetworkImage('https://i.imgur.com/WqRXc6V.jpg'),
                    image: NetworkImage("${event.picPath}"),
                    fit: BoxFit.cover
                ),
              ),
            ),

            new SliverPadding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: screenHeight/3),
              sliver:
              SliverList(
                delegate:
                SliverChildListDelegate([

                  Row( //datums-----------------------------------------------
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Card(
                        color: Colors.grey[800],
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child:
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2-15,
                          child:
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child:
                                  Text(
                                      "Van",
                                      textAlign: TextAlign.left,
                                      style:
                                      TextStyle(
                                        fontSize: 20,
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
                                    style:
                                    TextStyle(
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
                      ),

                      Card(
                        color: Colors.grey[800],
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child:
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2-15,
                          child:
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child:
                                  Text(
                                      "Tot",
                                      textAlign: TextAlign.left,
                                      style:
                                      TextStyle(
                                        fontSize: 20,
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
                                    style:
                                    TextStyle(
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
                      ),

                    ],
                  ),

                  Card( //omschrijving----------------------------------------
                    color: Colors.grey[800],
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child:
                      Column(
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

                  Padding( // deelnemers-------------------------------------
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width*0.7,
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
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),


                        RaisedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Icon(Icons.add, color: Color(0xff00285A), size: 30,),
                          ),
                          color: Colors.amber,
                        ),

                      ],
                    ),
                  ),

                  Padding(// kost---------------------------------------------
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width*0.7,
                          child: RaisedButton.icon(
                            splashColor: Colors.amber,
                            color: Colors.grey[800],
                            onPressed: () {
                              Navigator.pushNamed(context, '/loadingexpenses', arguments: {'id': event.eventId});
                            },
                            icon: Icon(Icons.list, color: Colors.white, size: 40, ),
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Kost:  ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Helvetica',
                                      decoration: TextDecoration.none,
                                    ),),
                                  Text("€ ${cost.toString()}",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 19,
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

                        RaisedButton(onPressed: () {},
                          child:
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:
                            Icon(
                              Icons.add,
                              color: Color(0xff00285A),
                              size: 30,
                            ),
                          ),
                          color: Colors.amber,
                        ),

                      ],
                    ),
                  ),

                  Card( //map-------------------------------------------------
                    color: Colors.grey[800],
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text("${event.location}",
                            style: TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Container(
                            height: 400,
                            width: 400,
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(this.lat, this.long),
                                zoom: 15.0,
                              ),
                              markers: Set<Marker>.of(markers.values),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding( // verwijder---------------------------------------
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                    child:
                    RaisedButton.icon(
                      color: Colors.red[200],
                      onPressed: () {
                        if(event.eventId != 1 && event.eventId != 2){
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Evenement verwijderen...')));
                          HttpService.deleteEvent(event.eventId).then((bool result) => Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,));
                        }
                      },
                      label: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Verwijder event",
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 15,
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
      ),
    );
  }
}
