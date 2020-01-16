import 'package:flutter/material.dart';
import 'package:Cleverdivide/classes/payment.dart';
import 'package:Cleverdivide/widgets/paymentListWidget.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map data = {};
  List<Payment> payments = new List();
  List<Payment> paymentsToPay;
  List<Payment> paymentsPaid;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    payments =  data['payments'];
    paymentsToPay = new List();
    paymentsPaid = new List();

    for (Payment p in payments) {
      if (p.isBetaald()) {
        paymentsPaid.add(p);
      } else {
        paymentsToPay.add(p);
      }
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Te betalen"),
              Tab(text: "Betaald"),
            ],
          ),
          title: Text("Betalingen"),
          backgroundColor: Color(0xff00285A),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/loadingPayments");
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
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                PaymentList(info: this.paymentsToPay, text: "Je hoeft niets te betalen!", one: true),
              ]
            ),
            ListView(
                children: <Widget>[
                  PaymentList(info: this.paymentsPaid, text: "Je hebt nog niets betaald!", one: false),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
