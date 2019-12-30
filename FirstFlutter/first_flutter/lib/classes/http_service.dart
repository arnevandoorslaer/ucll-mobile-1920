import 'dart:convert';
import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/classes/expense.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dueAndDebt.dart';

class HttpService {
  static Future<List<User>> getParticipants(int id) async {
    Response res =
        await get("http://www.arnevandoorslaer.ga:8086/event/$id/participants");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();

      users.sort((a, b) => a.getName().compareTo(b.getName()));
      return users;
    } else {
      throw "Can't get users";
    }
  }

  static Future<List<Expense>> getExpenses(int eventId) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/event/$eventId/payments");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Expense> expenses = body
          .map(
            (dynamic item) => Expense.fromJson(item),
          )
          .toList();

      expenses.sort((a, b) => a.getAmount().compareTo(b.getAmount()));
      return expenses;
    } else {
      throw "Failed to get expenses for certain event";
    }
  }

  static Future<List<User>> getUsers() async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/users");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();

      print(users);
      return users;
    } else {
      throw "Can't get users";
    }
  }

  static void addParticipant(int userId, int eventId) async {
    var res = await post(
        "http://www.arnevandoorslaer.ga:8086/event/$eventId/participants/add/$userId");

    if (res.statusCode == 201) {
      print("Added participant succesfully to event");
    } else {
      print("Failed to add participant to event");
    }
  }

  static void deleteParticipant(int userId, int eventId) async {
    var res = await post(
        "http://www.arnevandoorslaer.ga:8086/event/$eventId/participants/del/$userId");

    if (res.statusCode == 201) {
      print("Deleted participant succesfully from event");
    } else {
      print("Failed to delete participant from event");
    }
  }

  static Future<List<Event>> getEventsPerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username");
    if (username != null) {
      Response res = await get(
          "http://www.arnevandoorslaer.ga:8086/user/events/$username");
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);
        List<Event> events = body
            .map(
              (dynamic item) => Event.fromJson(item),
            )
            .toList();
        return events;
      } else {
        throw ("kan niet die evenementen ophalen vriend");
      }
    } else {
      return [];
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
      throw "Can't get users";
    }
  }

  static Future<String> getUsername(int userId) async {
    Response res =
        await get("http://www.arnevandoorslaer.ga:8086/user/$userId/username");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      print(cost.toString());
      return cost.toString();
    } else {
      throw "Can't get nickname of user with id $userId";
    }
  }

  static Future<bool> register(String username, String firstname,
      String lastname, String IBAN, String password) async {
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy =
        "{\"username\" : \"$username\", \"firstname\" : \"$firstname\", "
        "\"lastname\" : \"$lastname\", \"iban\" : \"$IBAN\",  \"password\" : \"$hashed\" }";
    Response res = await post("http://www.arnevandoorslaer.ga:8086/user/add",
        body: bodyy, headers: {"Content-Type": "application/json"});
    if (res.statusCode == 201) {
      return true;
    } else {
      throw Exception("Failed to register user");
    }
  }

  static Future<bool> login(String username, String password) async {
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy = "{\"username\" : \"$username\", \"password\" : \"$hashed\"}";
    Response res = await post("http://www.arnevandoorslaer.ga:8086/user/login",
        body: bodyy);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      int result = body;

      if (result == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("username", username);
        return true;
      } else if (result == -1) {
        throw Exception("User not found");
      } else {
        throw Exception("Password incorrect");
      }
    } else {
      throw Exception(
          "Can't login user '$username'. ${res.statusCode} - ${res.body}");
    }
  }

  static Future<String> getCostOfEvent(int eventid) async {
    Response res =
        await get("http://www.arnevandoorslaer.ga:8086/event/$eventid/cost");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      return cost.toString();
    } else {
      throw "Can't get cost of event with id $eventid.";
    }
  }

  static Future<bool> deleteEvent(int eventId) async {
    var res =
        await post("http://www.arnevandoorslaer.ga:8086/event/del/$eventId");

    if (res.statusCode == 200) {
      print("Deleting event succesful");
      return true;
    } else {
      print("Failed to delete event");
      return false;
    }
  }

  static Future<bool> addEvent(String name, String startDate, String endDate,
      String location, List participants, String info, String link) async {
    String body =
        "{\"eventName\":\"$name\",\"startDate\":\"$startDate\",\"endDate\":\"$endDate\",\"location\":\"$location\",\"participants\":[";
    for (int p in participants) {
      body += "$p,";
    }
    body = body.substring(0, body.length - 1);
    body += "],\"extraInfo\":\"$info\",";

    if (link.trim().isNotEmpty) {
      body += "\"picPath\":\"$link\"}";
    } else {
      body += "\"picPath\":\"https://i.imgur.com/WqRXc6V.jpg\"}";
    }

    print("request body: " + body);

    var res = await post(
      "http://www.arnevandoorslaer.ga:8086/event/add",
      body: body,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');

    if (res.statusCode == 201) {
      print("Adding event succesful");
      return true;
    } else {
      print("Failed to add event");
      return false;
    }
  }

  static Future<bool> addExpense(List participants, int payerId, double amount,
      int eventId, String description) async {
    String participantString = "[";
    for (int participant in participants) {
      participantString += "$participant,";
    }
    if (participantString.substring(participantString.length - 1) == ",") {
      participantString =
          participantString.substring(0, participantString.length - 1);
    }
    participantString += "]";

    String body =
        '{"participants":$participantString,"payer":$payerId,"amount":$amount,"eventId":$eventId,"message":"$description"}';
    print("request body: " + body);

    var res = await post(
      "http://www.arnevandoorslaer.ga:8086/payment/add",
      body: body,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');

    if (res.statusCode == 201) {
      print("Adding payment succesful");
      return true;
    } else {
      print("Failed to add payment");
      return false;
    }
  }

  static void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
  }

  static Future<List<DueAndDebt>> getProfileEventData(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/dataperevent/$username");
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DueAndDebt> info = body
          .map(
            (dynamic item) => DueAndDebt.fromJson(item),
          )
          .toList();
      return info;
    } else {
      throw "Can't get user event payments";
    }
  }

  static Future<List<DueAndDebt>> getProfileUserData(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/dataperuser/$username");
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DueAndDebt> info = body
          .map(
            (dynamic item) => DueAndDebt.fromJson(item),
          )
          .toList();
      return info;
    } else {
      throw "Can't get user payments";
    }
  }
}
