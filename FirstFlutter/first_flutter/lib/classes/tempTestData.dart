import 'package:Cleverdivide/classes/http_service.dart';

import 'eventDB.dart';
import 'user.dart';
import 'event.dart';

class TempTestData{
  static List<Event> getEvents () {
    var users = [
      User(userName: "BelgianNoise", name: "Arthur",
          surName: "Joppart", cardNumber: "BE00 0000 0000 0000"),
      User(userName: "Lemonade", name: "Styn",
          surName: "Taelemans", cardNumber: "BE11 1111 1111 1111"),
      User(userName: "BigBoiArne", name: "Arne",
          surName: "Vandoorslaer", cardNumber: "BE22 2222 2222 2222"),
      User(userName: "ZwaardSchild", name: "Ruben",
          surName: "Claes", cardNumber: "BE33 3333 3333 3333")
    ];
    HttpService.getUsers();
    /*
    return [
      Event(eventName: "VSV Week 2019",
          location: "Le Virinal + adres",
          startDate:  "",
          endDate: "",
          picPath: "virinal.jpg",
          extraInfo: "Epische week",
          participants: [1, 2]),
      Event(eventName: "BBC 4",
          location: "Kattem Strijtem ofzo",
          startDate: "",
          endDate: "",
          picPath: "bbc4.PNG",
          extraInfo: "Lekker smullen",
          participants: [1, 2]),
    ];*/
  }
  static List<User> getUsers(){
    return [
      User(userName: "BelgianNoise", name: "Arthur",
          surName: "Joppart", cardNumber: "BE00 0000 0000 0000"),
      User(userName: "Lemonade", name: "Styn",
          surName: "Taelemans", cardNumber: "BE11 1111 1111 1111"),
      User(userName: "BigBoiArne", name: "Arne",
          surName: "Vandoorslaer", cardNumber: "BE22 2222 2222 2222"),
      User(userName: "ZwaardSchild", name: "Ruben",
          surName: "Claes", cardNumber: "BE33 3333 3333 3333")
    ];
  }
}