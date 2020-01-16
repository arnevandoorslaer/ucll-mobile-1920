import 'dart:convert';
import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/payment.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/classes/expense.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dueAndDebt.dart';

class HttpService {

  static Future<List<User>> getParticipants(int id) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/$id/participants");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();

      users.sort((a, b) => a.getName().compareTo(b.getName()));

      print("Succesfully got participants for event with id '$id'");

      return users;
    } else {
      throw("Failed to get participants for event with id '$id'");
    }
  }

  static Future<List<Expense>> getExpenses(int eventId) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/$eventId/payments");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Expense> expenses = body
          .map(
            (dynamic item) => Expense.fromJson(item),
          )
          .toList();

      expenses.sort((a, b) => a.getAmount().compareTo(b.getAmount()));

      print("Succesfully got expenses for event with id '$eventId'");

      return expenses;
    } else {
      throw "Failed to get expenses for event with id '$eventId'";
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

      print("Succesfully got all users");

      return users;
    } else {
      throw "Failed to get all users";
    }
  }

  static void addParticipant(int userId, int eventId) async {
    var res = await post(
        "http://www.arnevandoorslaer.ga:8086/event/$eventId/participants/add/$userId");

    if (res.statusCode == 201) {
      print("Succesfully added participant with id '$userId' to event with id '$eventId'");
    } else {
      throw ("Failed to add participant with id '$userId' to event with id '$eventId'");
    }
  }

  static void addParticipantByUsername(String username, int eventId) async {
      var res = await post(
          "http://www.arnevandoorslaer.ga:8086/event/$eventId/participants/addusername/$username");

      if (res.statusCode == 201) {
        print("Succesfully added participant with username '$username' to event with id '$eventId'");
      } else {
        throw ("Failed to add participant with username '$username' to event with id '$eventId'");
      }
    }


  static void deleteParticipant(int userId, int eventId) async {
    var res = await post(
        "http://www.arnevandoorslaer.ga:8086/event/$eventId/participants/del/$userId");

    if (res.statusCode == 201) {
      print("Succesfully deleted participant with id '$userId' from event with id '$eventId'");
    } else {
      throw ("Failed to delete participant with id '$userId' from event with id '$eventId'");
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

        print("Succesfully got events for user '$username'");

        return events;
      } else {
        throw ("Failed to get events for user '$username'");
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

      print("Succesfully got all events");

      return events;
    } else {
      throw "Failed to get all events";
    }
  }

  static Future<Event> getEvent(int id) async {
    Response res =
    await get("http://www.arnevandoorslaer.ga:8086/event/get/$id");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      Event event = body;

      print("Succesfully got event by id '$id'");

      return event;
    } else {
      throw "Failed to get event by id '$id'";
    }
  }

  static Future<String> getUsername(int userId) async {
    Response res =
        await get("http://www.arnevandoorslaer.ga:8086/user/$userId/username");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      print("Succesfully got username of user by id '$userId'");

      return cost.toString();
    } else {
      throw "Failed to get username of user by id '$userId'";
    }
  }

  static Future<bool> register(String username, String firstname, String lastname, String IBAN, String password) async {
    IBAN = IBAN.replaceAll(" ", "").replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ").toUpperCase();
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy =
        "{\"username\" : \"$username\", \"firstname\" : \"$firstname\", "
        "\"lastname\" : \"$lastname\", \"iban\" : \"$IBAN\",  \"password\" : \"$hashed\" }";

    Response res = await post("http://www.arnevandoorslaer.ga:8086/user/add",
        body: bodyy, headers: {"Content-Type": "application/json"});

    if (res.statusCode == 201) {
      print("Succesfully registered user '$username'");
      return true;
    } else {
      throw Exception("Failed to register user '$username'");
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
        throw Exception("Failed to login: user '$username' not found");
      } else {
        throw Exception("Failed to login: password incorrect");
      }
    } else {
      throw Exception("Failed to login user '$username'. ${res.statusCode} - ${res.body}");
    }
  }

  static Future<String> getCostOfEvent(int eventid) async {
    Response res =
        await get("http://www.arnevandoorslaer.ga:8086/event/$eventid/cost");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      double cost = body;

      print("Succesfully got cost of event with id '$eventid'");

      return cost.toString();
    } else {
      throw "Failed to get cost of event with id '$eventid'";
    }
  }

  static Future<bool> deleteEvent(int eventId) async {
    var res =
        await post("http://www.arnevandoorslaer.ga:8086/event/del/$eventId");

    if (res.statusCode == 200) {
      print("Succesfully deleted event with id '$eventId'");
      return true;
    } else {
      print("Failed to delete event with id '$eventId'");
      return false;
    }
  }

  static Future<bool> addEvent(String name, String startDate, String endDate, String location, List participants, String info, String link) async {
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

    var res = await post(
      "http://www.arnevandoorslaer.ga:8086/event/add",
      body: body,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    Map<String, dynamic> responseBody = jsonDecode(res.body);
    int eid = responseBody['id'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("username");
    addParticipantByUsername(uid, eid);

    if (res.statusCode == 201) {
      print("Succesfully added event '$name'");
      return true;
    } else {
      print("Failed to add event '$name'");
      return false;
    }
  }

  static Future<bool> addExpense(List participants, int payerId, double amount, int eventId, String description) async {
    String participantString = "[";

    for (int participant in participants) {
      participantString += "$participant,";
    }
    if (participantString.substring(participantString.length - 1) == ",") {
      participantString =
          participantString.substring(0, participantString.length - 1);
    }
    participantString += "]";

    amount = (amount * 100).round() / 100;

    String body =
        '{"participants":$participantString,"payer":$payerId,"amount":$amount,"eventId":$eventId,"message":"$description"}';

    var res = await post(
      "http://www.arnevandoorslaer.ga:8086/payment/add",
      body: body,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (res.statusCode == 201) {
      print("Succesfully added payment '$description'");
      return true;
    } else {
      print("Failed to add payment '$description'");
      return false;
    }
  }

  static void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    print("Succesfully logged out user");
  }

  static Future<List<DueAndDebt>> getProfileEventData(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/dataperevent/$username");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DueAndDebt> info = body
          .map(
            (dynamic item) => DueAndDebt.fromJson(item),
          )
          .toList();

      print("Succesfully got payments per event for user '$username'");

      return info;
    } else {
      throw "Failed to get payments per event for user '$username'";
    }
  }

  static Future<List<DueAndDebt>> getProfileUserData(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/dataperuser/$username");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<DueAndDebt> info = body
          .map(
            (dynamic item) => DueAndDebt.fromJson(item),
          )
          .toList();

      print("Succesfully got payments per user for user '$username'");

      return info;
    } else {
      throw "Failed to get payments per user for user '$username'";
    }
  }

  static Future<double> getTotalDue(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/geven/$username");

    if (res.statusCode == 200) {
      print("Succesfully got total amount due for user '$username'");
      return jsonDecode(res.body);
    } else {
      throw "Failed to get total amount due for user '$username'";
    }
  }

  static Future<double> getTotalDebt(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/verkrijgen/$username");

    if (res.statusCode == 200) {
      print("Succesfully got total debt for user '$username'");
      return jsonDecode(res.body);
    } else {
      throw "failed to get total debt for user '$username'";
    }
  }

  static Future<List> getSuggestions(String location) async {
    String url = "http://autocomplete.geocoder.api.here.com/6.2/suggest.json?query=${location}&app_id=nX8zLCoiFwtK5k8EsyOG&app_code=0UxHEHej0MQdid88rq8IHw";
    Response res = await get(url);

    List<String> result = List();

    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      List<dynamic> yo = body["suggestions"];

      for (int g = 0; g < yo.length; g++) {
        result.add(yo[g]["label"]);
      }

      print("Succesfully got suggestions for location '$location'");

      return result;
    } else {
      throw "Failed to get suggestions for location '$location'";
    }
  }

  static Future<List<Payment>> getPayments(String username) async {
    Response res = await get(
        "http://www.arnevandoorslaer.ga:8086/user/$username/payments");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Payment> info = body
          .map(
            (dynamic item) => Payment.fromJson(item),
      )
          .toList();

      print("Succesfully got payments for user '$username'");

      return info;
    } else {
      throw "Failed to get payments for user '$username'";
    }
  }

  static Future<User> getUser(int id) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/user/get/$id");

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);

      User user = User.fromJson(body);
      if (user == null) {
        throw "User is null";
      }
      print("Succesfully got user ${user.getUserName()}");

      return user;
    } else {
      throw "Failed to get user";
    }
  }

  static Future<bool> markAsPaid(int paymentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String payee = prefs.getString("username");
    Response res = await get("http://www.arnevandoorslaer.ga:8086/markpayment/$payee/$paymentId");

    if (res.statusCode == 200) {
      return true;
    } else {
      throw "Failed to mark payment as paid";
    }
  }



}
