import 'dart:convert';

import 'package:Cleverdivide/classes/user.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>> getUsers() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
      )
          .toList();

      return users;
    } else {
      throw "Can't get users.";
    }
  }
}
