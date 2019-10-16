import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

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
                        //registreer code
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


            ],
          ),
        )
      ],
    );
  }
}
