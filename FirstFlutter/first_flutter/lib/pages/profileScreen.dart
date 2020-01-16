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
  List<DueAndDebt> eventinfo = [];
  List<DueAndDebt> userinfo = [];
  double totalDue = 0;
  double totalDebt = 0;
  double diff = 0;
  String text;
  String result = "";

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    username = data['username'];
    eventinfo = data['eventinfo'];
    userinfo = data['userinfo'];

    totalDue = data['due'];
    totalDebt = data['debt'];
    diff = totalDebt-totalDue;
    if(diff > 0){
      result = "Je moet nog €" + diff.toStringAsFixed(2).toString() + " krijgen.";
    }
    if(diff < 0){
      result = "Je moet nog  €" + diff.abs().toStringAsFixed(2).toString() + " betalen.";
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
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                  child: ButtonTheme(
                    minWidth: 50,
                    child: RaisedButton(
                      onPressed: () {Navigator.pushNamed(context, "/loadingPayments");},
                      child: Row(
                        children: <Widget>[
                          Text("Betalingen ",
                            style: TextStyle(
                              color: Color(0xff00285A),
                            ),
                          ),
                          Icon(
                            Icons.payment,
                            color: Color(0xff00285A),
                            size: 30,
                          ),
                        ],
                      ),
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),




            ListHeader(text: "$result",),
            ListHeader(text: "Bedragen per event:",),
            ProfileInfoList(info: this.eventinfo,),
            ListHeader(text: "Bedragen per user:",),
            ProfileInfoList(info: this.userinfo,)

          ],
        )
    );
  }
}
