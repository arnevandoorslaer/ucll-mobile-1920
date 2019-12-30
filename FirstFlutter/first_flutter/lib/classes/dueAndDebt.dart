class DueAndDebt{
  String name;
  double due, debt;

  DueAndDebt({ this.name, this.due, this.debt});

  factory DueAndDebt.fromJson(Map<String, dynamic> json) {
    return DueAndDebt(
        name: json['name'] as String,
        due: json['due'] as double,
        debt: json['debt'] as double
    );
  }
}