import 'package:Cleverdivide/classes/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/http_service.dart';

class LoadingPayments extends StatefulWidget {
  @override
  _LoadingPaymentsState createState() => _LoadingPaymentsState();
}

class _LoadingPaymentsState extends State<LoadingPayments> {
  String username;

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    getPayments(username);
  }

  void getPayments(String username) {
    HttpService.getPayments(username).then((List<Payment> payments) =>
      Navigator.pushReplacementNamed(context, '/payments', arguments: {'payments': payments})
    );
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
        title: Text(" Info Laden..."),
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



