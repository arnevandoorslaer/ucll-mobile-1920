import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';

class Payment {
  int id;
  String message;
  double price;
  bool betaald;
  User payer;

  Payment({this.id, this.message, this.price, this.betaald});

  int getId() {
    return this.id;
  }

  User getPayer() {
    return this.payer;
  }

  String getMessage() {
    return this.message;
  }

  double getPrice() {
    return this.price;
  }

  bool isBetaald() {
    return this.betaald;
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment (
        id: json['id'] as int,
        message: json['message'] as String,
        price: json['price'] as double,
        betaald: json['betaald'] as bool
    );
  }

}