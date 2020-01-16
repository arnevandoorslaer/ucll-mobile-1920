import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:Cleverdivide/classes/payment.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentList extends StatefulWidget {
  final List<Payment> info;
  final String text;
  final bool one;

  PaymentList({this.info, this.text, this.one});

  @override
  _PaymentListState createState() =>
      _PaymentListState(info: info, text: text, one: one);
}

class _PaymentListState extends State<PaymentList> {
  List<Payment> info;
  String text;
  bool one;

  _PaymentListState({this.info, this.text, this.one});

  @override
  Widget build(BuildContext context) {
    Column column;
    if (info.isNotEmpty) {
      column = Column(
        children: info.map((payment) {
          return FlatButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            onPressed: () {
              if (one) {
                showDialog(
                    context: context,
                    builder: (_) => new FutureBuilder(
                        future: HttpService.getUser(payment.getId()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            User user = snapshot.data;
                            return new AlertDialog(
                              title: new Text('Betaling'),
                              content: new Text(
                                "Je moet nog €${payment.getPrice()} betalen aan \n\n" +
                                    "${user.getName()}\n" +
                                    "${user.getIBAN()}",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.grey[200]),
                              ),
                              actions: <Widget>[
                                new RaisedButton(
                                  onPressed: () {
                                    HttpService.markAsPaid(
                                        payment.getPaymentId());
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            Navigator.of(context).pop(true);
                                            Navigator.pushReplacementNamed(
                                                context, "/loadingPayments");
                                          });
                                          return AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            title: Icon(Icons.check,
                                                color: Colors.amber, size: 128),
                                          );
                                        });
                                  },
                                  child: new Text('Markeer als betaald',
                                      style:
                                          TextStyle(color: Color(0xff00285A))),
                                  color: Colors.amber,
                                ),
                                new RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: new Text(
                                    'Terug',
                                    style: TextStyle(color: Color(0xff00285A)),
                                  ),
                                  color: Colors.amber,
                                ),
                              ],
                            );
                          } else {
                            return SpinKitRing(
                              color: Colors.amber,
                              size: 50.0,
                            );
                          }
                        }));
              }
            },
            child: Card(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      child: Text(
                        "${payment.getMessage()}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "€${payment.getPrice()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      );
    } else {
      column = Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    return column;
  }

  void _showAlert(Payment payment) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text('Betaling'),
              content: new Text(
                "Je moet nog ${payment}",
                style: new TextStyle(fontSize: 20.0, color: Colors.grey[200]),
              ),
              actions: <Widget>[
                new RaisedButton(
                  onPressed: () {},
                  child: new Text('Markeer als betaald',
                      style: TextStyle(color: Color(0xff00285A))),
                  color: Colors.amber,
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    'Terug',
                    style: TextStyle(color: Color(0xff00285A)),
                  ),
                  color: Colors.amber,
                ),
              ],
            ));
  }
}
