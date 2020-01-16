import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/http_service.dart';
import 'package:geocoder/geocoder.dart';

class LoadingEventFromExpenseParticipants extends StatefulWidget {
  @override
  _LoadingEventFromExpenseParticipantsState createState() => _LoadingEventFromExpenseParticipantsState();
}

class _LoadingEventFromExpenseParticipantsState extends State<LoadingEventFromExpenseParticipants> {

  Map data = {};
  int id;
  Event event;

  void getEvent() async{
    HttpService.getEvents().then((List<Event> events) =>
        getData(events)).catchError(throw "met kindern haha");
  }

  void getData(events) async{
    for (Event e in events){
      if (e.getEventId() == id){
        this.event = e;
      }
    }

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

    Navigator.pushReplacementNamed(context, '/event', arguments: {'event': event, 'coordinates' : coordinates});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    id = data['id'];
    print(id);
    getEvent();

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



