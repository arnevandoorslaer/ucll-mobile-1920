class DueAndDebt{
  String eventName;
  double due, debt;

  DueAndDebt({ this.eventName, this.due, this.debt});

  factory DueAndDebt.fromJson(Map<String, dynamic> json) {
    return DueAndDebt(
        eventName: json['event'] as String,
        due: json['due'] as double,
        debt: json['debt'] as double
    );
  }
}