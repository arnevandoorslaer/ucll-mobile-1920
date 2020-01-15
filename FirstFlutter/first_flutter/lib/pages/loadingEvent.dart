import 'package:Cleverdivide/classes/event.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:geocoder/geocoder.dart';

class LoadingEvent extends StatefulWidget {
  @override
  _LoadingEventState createState() => _LoadingEventState();
}

class _LoadingEventState extends State<LoadingEvent> {

  Map data = {};
  Event event;

  void getData() async{
    await LocationPermissions().requestPermissions();
    data = ModalRoute.of(context).settings.arguments;
    event = data['event'];

    final query = event.location;
    var addresses = await Geocoder.local.findAddressesFromQuery("Grote Markt, Leuven, Belgium"); //default

    try{
      var address = await Geocoder.local.findAddressesFromQuery(query);
      addresses = address;


    }catch(exception){
      print("Locatie lowkey ni gevonden, dus pakt da de default gezet is");
    }

    var first = addresses.first;
    Coordinates coordinates = first.coordinates;

    Navigator.pushReplacementNamed(context, '/event',
        arguments: {'event': event, 'coordinates' : coordinates});

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: CustomAppBarWidget(text: "Event Info Laden...",),
      body: Center(
        child: SpinKitRing(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}