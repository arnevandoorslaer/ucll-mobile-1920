import 'user.dart';
import 'event.dart';

class TempTestData{
  static List<Event> getEvents () {
    var users = [
      User(userName: "BelgianNoise", name: "Arthur",
          sirName: "Joppart", cardNumber: "BE00 0000 0000 0000"),
      User(userName: "Lemonade", name: "Styn",
          sirName: "Taelemans", cardNumber: "BE11 1111 1111 1111"),
      User(userName: "BigBoiArne", name: "Arne",
          sirName: "Vandoorslaer", cardNumber: "BE22 2222 2222 2222"),
      User(userName: "ZwaardSchild", name: "Ruben",
          sirName: "Claes", cardNumber: "BE33 3333 3333 3333")
    ];
    return [
      Event(eventName: "VSV Week 2019",
          location: "Le Virinal + adres",
          startDate: new DateTime(2019, 09, 02),
          endDate: new DateTime(2019, 09, 06),
          picPath: "virinal.jpg",
          extraInfo: "Epische week",
          participants: [users[0], users[1], users[2]]),
      Event(eventName: "BBC 4",
          location: "Kattem Strijtem ofzo",
          startDate: new DateTime(2019, 08, 02),
          endDate: new DateTime(2019, 08, 03),
          picPath: "bbc4.PNG",
          extraInfo: "Lekker smullen",
          participants: [users[0], users[1], users[3]]),
    ];
  }
  static List<User> getUsers(){
    return [
      User(userName: "BelgianNoise", name: "Arthur",
          sirName: "Joppart", cardNumber: "BE00 0000 0000 0000"),
      User(userName: "Lemonade", name: "Styn",
          sirName: "Taelemans", cardNumber: "BE11 1111 1111 1111"),
      User(userName: "BigBoiArne", name: "Arne",
          sirName: "Vandoorslaer", cardNumber: "BE22 2222 2222 2222"),
      User(userName: "ZwaardSchild", name: "Ruben",
          sirName: "Claes", cardNumber: "BE33 3333 3333 3333")
    ];
  }
}