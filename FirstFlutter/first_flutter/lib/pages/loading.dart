import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/http_service.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List participants;
  String username;

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
  }

  void getParticipants() async{
    HttpService.getUsers().then((List<User> result) =>
    getEvents(result)).catchError(throw "Failed to get participants");
  }

  void getEvents(List participants) async{
    HttpService.getEventsPerUser().then((List<Event> result) =>
        Navigator.pushReplacementNamed(context, '/home',
            arguments: {'events': result, 'participants': participants, 'username': username}))
        .catchError(throw "met kindern haha");
  }

  @override
  void initState() {
    super.initState();
    getUsername();
    getParticipants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(text: "Aan het laden...",),
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



