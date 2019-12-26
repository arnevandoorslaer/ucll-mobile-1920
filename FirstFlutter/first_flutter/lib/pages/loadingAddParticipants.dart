import 'dart:io';
import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home.dart';

class LoadingAddParticipants extends StatefulWidget {
  @override
  _LoadingAddParticipantsState createState() => _LoadingAddParticipantsState();
}

class _LoadingAddParticipantsState extends State<LoadingAddParticipants> {

  Map data = {};
  int id;

  void getData() async{
    data = ModalRoute.of(context).settings.arguments;
    id = data['id'];

    HttpService.getParticipants(id).then((List<User> participants) =>
          getUsers(participants)
        ).catchError(throw "Failed to get participants");
  }
  
  void getUsers(List participants) async{
    HttpService.getUsers().then((List<User> users) =>
        Navigator.pushReplacementNamed(context, '/addparticipants', arguments: {'participants':participants, 'users': users, 'id': id})
    ).catchError(throw "Failed to get users");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: CustomAppBarWidget(text: "Gebruikers ophalen...",),
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



