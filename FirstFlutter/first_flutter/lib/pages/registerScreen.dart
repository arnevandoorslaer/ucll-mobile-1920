import 'package:Cleverdivide/widgets/registerForm.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registreren"),
        backgroundColor: Color(0xff00285A),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),

      body: RegisterForm(),
      backgroundColor: Colors.grey[900],
    );
  }
}
