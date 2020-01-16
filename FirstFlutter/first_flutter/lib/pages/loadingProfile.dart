import 'package:Cleverdivide/classes/dueAndDebt.dart';
import 'package:Cleverdivide/classes/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/http_service.dart';

class LoadingProfile extends StatefulWidget {
  @override
  _LoadingProfileState createState() => _LoadingProfileState();
}

class _LoadingProfileState extends State<LoadingProfile> {
  String username;

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    getTotalDue();
  }

  void getTotalDue() async{
    HttpService.getTotalDue(username).then((double due) =>
        getTotalDebt(due));
  }

  void getTotalDebt(double due) async{
    HttpService.getTotalDebt(username).then((double debt) =>
        getProfileEventData(due,debt));
  }

  void getProfileEventData(double due,double debt) async{
    HttpService.getProfileEventData(username).then((List<DueAndDebt> eventresult) =>
        getProfileUserData(eventresult,due,debt));
  }

  void getProfileUserData(List<DueAndDebt> eventresult,double due,double debt) async{
    HttpService.getProfileUserData(username).then((List<DueAndDebt> userresult) =>
        Navigator.pushReplacementNamed(context, '/profile',
            arguments: {'due': due, 'debt':debt, 'userinfo': userresult, 'eventinfo': eventresult, 'username': username}));
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUsername();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiel Info Laden..."),
        backgroundColor: Color(0xff00285A),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
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



