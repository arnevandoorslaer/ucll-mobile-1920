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
}