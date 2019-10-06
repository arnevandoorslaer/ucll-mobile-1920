import 'package:first_flutter/pages/addEvent.dart';
import 'package:first_flutter/pages/loading.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => Loading(),
    "/home" : (context) => Home(),
    "/add" : (context) => AddEvent(),
  },
));
