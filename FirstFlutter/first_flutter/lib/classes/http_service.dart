import 'dart:convert';
import 'package:Cleverdivide/classes/event.dart';
import 'package:Cleverdivide/classes/user.dart';
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
  static Future<bool> register(String username, String firstname, String lastname,
      String IBAN, String password) async {
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy = "{\"username\" : \"$username\", \"firstname\" : \"$firstname\", "
        "\"lastname\" : \"$lastname\", \"iban\" : \"$IBAN\",  \"password\" : \"$hashed\" }";
    Response res = await post("http://www.arnevandoorslaer.ga:8086/user/add",
    body:bodyy, headers: {"Content-Type" : "application/json"});
    if (res.statusCode == 201) {
      return true;
    }else{
      throw Exception("Kan niet registreren!");
    }
  }
  static Future<bool> login(String username, String password) async {
    var hashed = sha512.convert(utf8.encode(password));
    var bodyy = "{\"username\" : \"$username\", \"password\" : \"$hashed\"}";
    print("$hashed");
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

  /*
  static void deleteEvent(int eventid) async {
    Response res = await get("http://www.arnevandoorslaer.ga:8086/event/del/$eventid");

    if (res.statusCode != 200) {
      throw "Failed to delete event with id $eventid";
    }
  }*/
  
  static Future<bool> addEvent(String name, String startDate, String endDate, String location, List participants, String info) async {
    String body = "{\"eventName\":\"$name\",\"startDate\":\"$startDate\",\"endDate\":\"$endDate\",\"location\":\"$location\",\"participants\":[";
    for (int p in participants){
      body += "$p,";
    }
    body = body.substring(0, body.length - 1);
    body += "],\"extraInfo\":\"$info\",\"picPath\":\"virinal.jpg\"}";

    print(body);

    var res = await post("http://www.arnevandoorslaer.ga:8086/event/add", body: body, headers: {
    "content-type" : "application/json",
    "accept" : "application/json",
    },);

    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');

    if (res.statusCode == 201) {
      print("Adding event succesful.");
      return true;
    }
    else {
      print("Failed to add event.");
      return false;
    }
  }
}