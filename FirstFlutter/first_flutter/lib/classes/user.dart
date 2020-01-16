class User{
    String name, surName, cardNumber, userName;
    int id;

    User({this.userName, this.name, this.surName, this.cardNumber, this.id});

    String getName(){
        return name + " " + surName;
    }

    int getId(){
        return this.id;
    }

    String getUserName(){
        return this.userName;
    }

    String getFirstName() {
        return this.name;
    }

    String getIBAN() {
        return this.cardNumber;
    }

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            id: json['id'] as int,
            name: json['firstname'] as String,
            surName: json['lastname'] as String,
            cardNumber: json['iban'] as String,
            userName: json['username'] as String,
        );
    }
}