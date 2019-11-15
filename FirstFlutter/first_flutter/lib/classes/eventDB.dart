import 'dart:convert';
import 'dart:io';
import 'event.dart';


class EventDB{
  List<Event> events;

  EventDB(){
    getEvents();
    print(events);
  }

  void getEvents() async {
    // produces a request object
    var request = await HttpClient().getUrl(Uri.parse('http://www.arnevandoorslaer.ga:8086/events'));  // sends the request
    var response = await request.close();

    // transforms and prints the response
    await for (var contents in response.transform(Utf8Decoder())) {
      print(contents);
    }
  }

  Event getEventById() {

  }


}