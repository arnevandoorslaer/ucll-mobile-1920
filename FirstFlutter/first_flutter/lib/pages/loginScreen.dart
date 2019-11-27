import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String username = "kk";
  String password = "kk";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[900],
        appBar: CustomAppBarWidget(text: "Login",),
        body:ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: TextFormField(
                      onChanged: (String value) {username = value;},
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Dit veld mag niet leeg zijn!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Gebruikersnaam: ',
                        labelStyle: TextStyle(
                          color: Colors.amber,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber)
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber)
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: TextFormField(
                      onChanged: (String value) {password = value;},
                      obscureText: true,
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Dit veld mag niet leeg zijn!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Wachtwoord: ',
                        labelStyle: TextStyle(
                          color: Colors.amber,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber)
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber)
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: RaisedButton(
                        onPressed: () {
                            if (_formKey.currentState.validate()) {
                              HttpService.login(username, password).then((val){
                                _scaffoldKey.currentState.
                                showSnackBar(
                                    SnackBar(content: Text('Ingelogd makker')));
                              })
                              .catchError((err){
                                _scaffoldKey.currentState
                                    .showSnackBar(SnackBar(content: Text('$err')));
                              });
                            }
                        },
                        color: Colors.amber,
                        child: Text('Inloggen',
                            style: TextStyle(
                              color: Color(0xff00285A),
                            )
                        )
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    indent: 30,
                    endIndent: 30,
                  ),
                  Center(
                    child: Text('of',
                      style: TextStyle(color: Colors.grey[600])
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    indent: 30,
                    endIndent: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context,  "/register");
                        },
                        color: Colors.amber,
                        child: Text('Registreren',
                            style: TextStyle(
                              color: Color(0xff00285A),
                            )
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
