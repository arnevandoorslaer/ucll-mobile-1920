import 'dart:convert';
import 'dart:ffi';

import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:http/http.dart';

class HttpService {

  static Future<List<User>> getParticipants(int id) async{
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/$id/participants");

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
  static Future<List<User>> getUsers() async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/users");

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

  static Future<bool> login(int userid, String hashedPassword) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/user/$userid/login");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      int result = body;

      if (result == 1) {
        return true;
      }
      else if (result == -1) {
        throw "User not found";
      }
      else {
        throw "Password incorrect";
      }

    } else {
      throw "Can't login user with id $userid.";
    }
  }

  static Future<Double> getCostOfEvent(int eventid) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/$eventid/cost");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      Double cost = body;

      print(cost);
      return cost;
    } else {
      throw "Can't get cost of event with id $eventid.";
    }
  }
}
