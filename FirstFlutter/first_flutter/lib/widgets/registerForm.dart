import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String password, password2;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ibanController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ibanController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding( // USERNAME----------------------------------------------
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
                    if(value.contains(" ")){
                      return "Gebruikersnaam mag geen spaties bevatten!";
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

              Padding( // FIRST NAME--------------------------------------------
                padding: const EdgeInsets.fromLTRB(10,0,10,10),
                child: TextFormField(
                  controller: firstNameController,
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

              Padding( // LAST NAME---------------------------------------------
                padding: const EdgeInsets.fromLTRB(10,0,10,10),
                child: TextFormField(
                  controller: lastNameController,
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

              Padding( // IBAN--------------------------------------------------
                padding: const EdgeInsets.fromLTRB(10,0,10,10),
                child: TextFormField(
                  controller: ibanController,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Dit veld mag niet leeg zijn!";
                    }
                    if (value.replaceAll(" ", "").length != 16) {
                      return "Lengte IBAN klopt niet!";
                    }
                    if (!new RegExp("\\w{2}\\d{2}( ?\\d{4}){3}").hasMatch(value)) {
                      return "Iets is niet helemaal juist!";
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter(RegExp("[0-9 beBEnlNL]")),
                  ],
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

              Padding( // PASSWORD----------------------------------------------
                padding: const EdgeInsets.fromLTRB(10,0,10,10),
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (String value) {password = value;},
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

              Padding( // PASSWORD REPEAT---------------------------------------
                padding: const EdgeInsets.fromLTRB(10,0,10,10),
                child: TextFormField(
                  onChanged: (String value) {password2 = value;},
                  obscureText: true,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Dit veld mag niet leeg zijn!";
                    }
                    if(value != password){
                      return "Wachtwoorden komen niet overeen!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Herhaal wachtwoord: ',
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

              Padding( // REGISTER BUTTON---------------------------------------
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Bezig met registreren...')));

                        HttpService.register(usernameController.text, firstNameController.text, lastNameController.text, ibanController.text, passwordController.text)
                            .then((bool value) {
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
