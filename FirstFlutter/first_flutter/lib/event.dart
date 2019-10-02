import "user.dart";
import 'package:intl/intl.dart';

class Event{
  String eventName;
  DateTime startDate, endDate;
  String location;
  List<User> participants;
  String extraInfo;

  Event({this.eventName, this.location, this.extraInfo, this.startDate, this.endDate, this.participants});

  String getStartDateFormatted(){
    return DateFormat('dd-MM-yyyy').format(startDate);
  }
  String getEndDateFormatted(){
    return DateFormat('dd-MM-yyyy').format(endDate);
  }
}