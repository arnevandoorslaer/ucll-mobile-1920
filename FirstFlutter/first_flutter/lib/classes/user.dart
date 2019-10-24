class User{
    String name, surName, cardNumber, userName;

    User({this.userName, this.name, this.surName, this.cardNumber});

    String getName(){
        return name + " " + surName;
    }
}