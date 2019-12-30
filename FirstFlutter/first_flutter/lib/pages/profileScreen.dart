import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Color(0xff00285A),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacementNamed(context,  "/");
              },
            ),
          ],
        ),
        body:ListView(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'EPISCHE PROFILE PAGINA',
                style: DefaultTextStyle.of(context).style,
              ),
            )
          ],
        )
    );
  }
}
