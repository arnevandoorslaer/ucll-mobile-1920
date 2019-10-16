import 'package:Cleverdivide/widgets/appbar.dart';
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
      appBar: CustomAppBarWidget(text: "Registreren",),
      body: RegisterForm(),
      backgroundColor: Colors.grey[900],
    );
  }
}
