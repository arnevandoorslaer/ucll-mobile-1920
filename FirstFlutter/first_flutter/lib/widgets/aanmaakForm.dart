import 'dart:async';

import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/widgets/multiSelect.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AanmaakForm extends StatefulWidget {
  @override
  _AanmaakFormState createState() => _AanmaakFormState();
}

class _AanmaakFormState extends State<AanmaakForm> {
  Map data = {};
  List<User> users = [];
  List participants = [];
  List usersMultiSelect = [];

  @override
  void initState() {
    super.initState();
  }


  final _formKey = GlobalKey<FormState>();
  DateTime start = DateTime.now(), end = DateTime.now();

  final eventNameController = TextEditingController();
  final locationController = TextEditingController();
  final infoController = TextEditingController();
  final pictureController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    eventNameController.dispose();
    locationController.dispose();
    infoController.dispose();
    pictureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    users = data['participants'];

    List kweeni = [];
    for (User p in users){
      kweeni.add({"display": p.getName(), "value": p.getId()});
    }
    usersMultiSelect = kweeni;

    return ListView(
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(//EVENT NAME--------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: eventNameController,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value.trim().isEmpty || value == null) {
                        return "Dit veld mag niet leeg zijn!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Naam van evenement: ',
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

                Padding(// LOCATION---------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TypeAheadFormField (
                    suggestionsCallback: (city) {
                      if (city != null && !city.trim().isEmpty) {
                        return HttpService.getSuggestions(city);
                      }
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (suggestion) {
                      return this.locationController.text = suggestion;
                    },
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: locationController,
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Locatie / Adres: ',
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
                    validator: (value) {
                      if (value.trim().isEmpty || value == null) {
                        return "Dit veld mag niet leeg zijn!";
                      }
                      return null;
                    },
                  ),
                ),

                Padding(// START DATE-------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Text("Start: ",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ),
                          Text(DateFormat('dd-MM-yyyy  HH:mm').format(start),
                              style: TextStyle(color: Colors.white)
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
                        child: ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: RaisedButton.icon(
                            color: Colors.amber,
                            onPressed: () {
                              DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                    setState(() {
                                      this.start = date;
                                    });
                                  },
                                  onConfirm: (date) {
                                    setState(() {
                                      this.start = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.nl);
                            },
                            icon: Icon(Icons.calendar_today,
                              color: Color(0xff00285A),),
                            label: Text("Wijzig",
                              style: TextStyle(
                              color: Color(0xff00285A),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(// END DATE---------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Text("Einde: ",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                              )
                          ),
                          Text(DateFormat('dd-MM-yyyy  HH:mm').format(end),
                              style: TextStyle(color: Colors.white)
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                        child: ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: RaisedButton.icon(
                            color: Colors.amber,
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                    setState(() {
                                      this.end = date;
                                    });
                                  },
                                  onConfirm: (date) {
                                    setState(() {
                                      this.end = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.nl);
                            },
                            icon: Icon(Icons.calendar_today,
                              color: Color(0xff00285A),),
                            label: Text("Wijzig",
                            style: TextStyle(
                              color: Color(0xff00285A),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding( // PARTICIPANTS----------------------------------------
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: MultiSelect(
                      autovalidate: false,
                      hintText: "Druk hier om mensen toe te voegen...",
                      titleText: "Selecteer deelnemers: ",
                      errorText: 'Selecteer deelnemers: ',
                      validator: (value) {
                        if (value == null) {
                          return 'Gelieve een of meer deelnemers te selecteren';
                        }
                      },
                      dataSource: this.usersMultiSelect,
                      textField: 'display',
                      valueField: 'value',
                      required: true,
                      value: participants,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          participants = value;
                        });
                      },
                    ),
                ),

                Padding( // INFO------------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: infoController,
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
                      labelText: 'Extra info: ',
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

                Padding( // IMAGE-----------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: pictureController,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Link afbeelding: ',
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

                Padding( // ADD BUTTON----------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child:
                  RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        var formatter = new DateFormat('dd-MM-yyyy HH:mm:ss');
                        String startDate = formatter.format(start);
                        String endDate = formatter.format(end);

                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Evenement wordt toegevoegd...')));

                        HttpService.addEvent(eventNameController.text, startDate, endDate, locationController.text, participants, infoController.text, pictureController.text).then((bool result) => Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,));
                      }
                      },
                    color: Colors.amber,
                    child: Text('Toevoegen',
                      style: TextStyle(
                        color: Color(0xff00285A),
                      ),
                    ),
                  ),
                ),

              ],
            )
        ),
      ],

    );
  }
}