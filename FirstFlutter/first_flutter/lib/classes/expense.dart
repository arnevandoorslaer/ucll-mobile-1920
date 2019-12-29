class Expense{

  int id, eventId, payerId;
  double amount, amountPerUser;
  String description;
  List<dynamic> participants;

  Expense({this.id, this.participants, this.payerId, this.amount, this.eventId, this.description, this.amountPerUser});

  int getId(){
    return this.id;
  }

  List<dynamic> getParticipants(){
    return this.participants;
  }

  int getPayerId(){
    return this.payerId;
  }

  double getAmount(){
    return this.amount;
  }

  int getEventId(){
    return this.eventId;
  }

  String getDescription(){
    return description;
  }

  double getAmountPerUser(){
    return this.amountPerUser;
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'] as int,
      participants: json['participants'] as List<dynamic>,
      payerId: json['payer'] as int,
      amount: json['amount'] as double,
      eventId: json['eventId'] as int,
      description: json['message'] as String,
      amountPerUser: json['amountPerUser'] as double
    );
  }
}