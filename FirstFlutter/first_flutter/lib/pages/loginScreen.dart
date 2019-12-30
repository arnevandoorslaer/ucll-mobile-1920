import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
          title: Text("Login"),
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
        body:ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Padding( // USERNAME------------------------------------------
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: TextFormField(
                      controller: usernameController,
                      maxLines: 1,
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

                  Padding( // PASSWORD------------------------------------------
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      maxLines: 1,
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

                  Padding( // LOGIN BUTTON--------------------------------------
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: RaisedButton(
                        onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Bezig met inloggen...')));

                              HttpService.login(usernameController.text, passwordController.text)
                                  .then((bool result) {
                                Navigator.of(context).popUntil((route) =>
                                route.isFirst);
                                Navigator.pushReplacementNamed(context, "/");
                              })
                                  .catchError((err){
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(err.toString().replaceAll("Exception: ", ""))));
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

                  Padding( // REGISTER BUTTON-----------------------------------
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
