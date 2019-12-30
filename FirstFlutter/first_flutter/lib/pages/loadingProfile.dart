import 'package:Cleverdivide/classes/dueAndDebt.dart';
import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/http_service.dart';

class LoadingProfile extends StatefulWidget {
  @override
  _LoadingProfileState createState() => _LoadingProfileState();
}

class _LoadingProfileState extends State<LoadingProfile> {
  List participants;
  String username;

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");

    HttpService.getProfileData(username).then((List<DueAndDebt> result) =>
        Navigator.pushReplacementNamed(context, '/profile',
            arguments: {'info': result, 'username': username}))
        .catchError(throw "met kindern haha");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: CustomAppBarWidget(text: "Loading Profile Info...",),
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



