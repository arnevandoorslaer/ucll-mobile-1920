import '../classes/event.dart';
import '../classes/tempTestData.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Event> events = [];

  void getData() async{
    // Response res = await get("http://demo9672618.mockable.io/fluttertest");
    // Map data = jsonDecode(res.body);
    //temp
    events = TempTestData.getEvents();
    Future.delayed(Duration(milliseconds: 5000)).then((_) {
      Navigator.pushReplacementNamed
        (context, '/home', arguments: {'events': events});
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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



