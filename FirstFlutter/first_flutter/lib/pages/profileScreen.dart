import 'package:Cleverdivide/classes/dueAndDebt.dart';
import 'package:Cleverdivide/widgets/listHeader.dart';
import 'package:Cleverdivide/widgets/profileInfoListWidget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map data = {};
  String username;
  List<DueAndDebt> info = [];
  String text;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    username = data['username'];
    info = data['info'];
    if (username == null) {
      text = "bruh";
    } else {
      text = "$username";
    }

    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Profiel"),
          backgroundColor: Color(0xff00285A),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/loadingProfile");
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListHeader(text: "Aangemeld als:",),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                    child: Text(
                      "$username",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListHeader(text: "Bedragen per event:",),
            ProfileInfoList(info: this.info,)

          ],
        ));
  }
}
