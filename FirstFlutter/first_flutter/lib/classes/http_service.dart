import 'dart:convert';

import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:http/http.dart';

class HttpService {

  static Future<List<User>> getUsers() async {
    Response res = await get("www.arnevandoorslaer.ga:8086/users");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      // fromJson is belangrijk niet vergeten invullen bij nieuwe dingen guys
      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
      )
          .toList();

      print(users);
      return users;
    } else {
      throw "Can't get users.";
    }
  }

  static Future<List<Event>> getEvents() async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/events");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Event> events = body
          .map(
            (dynamic item) => Event.fromJson(item),
      )
          .toList();

      print(events);
      return events;
    } else {
      throw "Can't get users.";
    }
  }
}
