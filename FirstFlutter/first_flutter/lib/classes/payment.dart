import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/classes/user.dart';

class Payment {
  int payerId;
  int paymentId;
  String message;
  double price;
  bool betaald;
  User payer;

  Payment({this.payerId, this.paymentId, this.message, this.price, this.betaald});

  int getId() {
    return this.payerId;
  }

  int getPaymentId() {
    return this.paymentId;
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
        payerId: json['id'] as int,
        paymentId: json['payment_id'] as int,
        message: json['message'] as String,
        price: json['price'] as double,
        betaald: json['betaald'] as bool
    );
  }

}