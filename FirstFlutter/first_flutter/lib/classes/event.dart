import 'user.dart';
import 'package:intl/intl.dart';

class Event{
  String eventName;
  String startDate, endDate;
  String location;
  List<int> participants;
  String extraInfo;
  String picPath;

  Event({this.eventName, this.location, this.extraInfo,
    this.startDate, this.endDate, this.participants, this.picPath});

  static Event fromJson(json) {
    Event event = new Event();
    event.eventName = json.eventName;
    event.startDate = json.startDate;
    event.endDate = json.endDate;
    event.location = json.location;
    event.participants = json.participants;
    event.extraInfo = json.extraInfo;
    event.picPath = json.picPath;
    return event;
  }
}