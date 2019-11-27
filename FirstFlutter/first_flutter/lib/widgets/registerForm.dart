import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String username, firstname, lastname, IBAN, password, password2;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    if(value.contains(" ")){
                      return "Geen spaties bitch!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Gebruikersnaam (geen spaties): ',
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
                  onChanged: (String value) {firstname = value;},
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
                    labelText: 'Voornaam: ',
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
                  onChanged: (String value) {lastname = value;},
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
                    labelText: 'Achternaam: ',
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
                  onChanged: (String value) {IBAN = value;},
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
                    labelText: 'IBAN: ',
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
                    labelText: 'Paswoord: ',
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
                  onChanged: (String value) {password2 = value;},
                  obscureText: true,
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Dit veld mag niet leeg zijn!";
                    }
                    if(value != password){
                      return "Wachtwoorden komen niet overeen";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Herhaal paswoord: ',
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
                      if(_formKey.currentState.validate()){
                        HttpService.register(username, firstname, lastname, IBAN, password)
                            .then((val) {
                          Navigator.pop(context);
                        });
                      }
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
    );
  }
}
