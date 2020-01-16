import 'user.dart';
import 'package:intl/intl.dart';

class Event{
  int eventId;
  String eventName;
  String startDate, endDate;
  String location;
  List<dynamic> participants;
  String extraInfo;
  String picPath;

  Event({this.eventId, this.eventName, this.location, this.extraInfo,
    this.startDate, this.endDate, this.participants, this.picPath}){
    klonk();
  }
    void klonk(){
      startDate = startDate.substring(0,startDate.length-3);
      endDate = endDate.substring(0,endDate.length-3);
    }

    int getEventId(){
      return this.eventId;
    }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        eventId: json['id'] as int,
        eventName: json['eventName'] as String,
        startDate: json['startDate'] as String,
        endDate: json['endDate'] as String,
        location: json['location'] as String,
        extraInfo: json['extraInfo'] as String,
        picPath: json['picPath'] as String,
        participants: json['participants'] as List<dynamic>
    );
  }
}