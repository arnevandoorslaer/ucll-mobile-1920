import 'dart:convert';
import 'dart:ffi';

import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';

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

  static Future<String> getUsername(int userId) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/user/$userId/username");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      print(cost.toString());
      return cost.toString();
    } else {
      throw "Can't get nickname of user with id $userId.";
    }
  }

  static Future<bool> login(String username, String password) async {
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy = "{\"username\" : \"$username\", \"password\" : \"$hashed\"}";

    Response res = await post(
        "http://www.arnevandoorslaer.ga:8086/user/login", body: bodyy);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      int result = body;

      if (result == 1) {
        return true;
      }
      else if (result == -1) {
        throw Exception("User not found");
      }
      else {
        throw Exception("Password incorrect");
      }
    } else {
      throw Exception("Can't login user '$username'. ${res.statusCode} - ${res.body}");
    }
  }

  static Future<String> getCostOfEvent(int eventid) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/$eventid/cost");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      print(cost.toString());
      return cost.toString();
    } else {
      throw "Can't get cost of event with id $eventid.";
    }
  }
}
