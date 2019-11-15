import 'dart:convert';

import 'package:Cleverdivide/classes/user.dart';
import 'package:http/http.dart';

class HttpService {

  static Future<List<User>> getUsers() async {
    Response res = await get("www.arnevandoorslaer.ga:8086/users");

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
      throw "Can't get users.";
    }
  }
}
