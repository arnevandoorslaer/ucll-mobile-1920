import 'dart:io';

import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';

import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';

class LoadingParticipants extends StatefulWidget {
  @override
  _LoadingParticipantsState createState() => _LoadingParticipantsState();
}

class _LoadingParticipantsState extends State<LoadingParticipants> {

  Map data = {};
  int id;

  void getData() async{
    data = ModalRoute.of(context).settings.arguments;
    id = data['id'];

    HttpService.getParticipants(id).then((List<User> result) =>
        Navigator.pushReplacementNamed(context, '/participants',
            arguments: {'users': result}))
        .catchError(throw "met kindern");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: CustomAppBarWidget(text: "Loading...",),
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



