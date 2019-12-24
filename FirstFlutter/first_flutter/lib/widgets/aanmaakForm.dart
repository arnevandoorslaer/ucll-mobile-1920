import 'package:Cleverdivide/classes/http_service.dart';
import 'package:Cleverdivide/widgets/listHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

class AanmaakForm extends StatefulWidget {
  @override
  _AanmaakFormState createState() => _AanmaakFormState();
}

class _AanmaakFormState extends State<AanmaakForm> {
  List participants;


  @override
  void initState() {
    super.initState();
    participants = [];

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


                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: locationController,
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
                ),

                Padding(  // START START START START START
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    children: <Widget>[
                      Text("Start: ",
                          style: TextStyle(color: Colors.amber)
                      ),
                      Text(DateFormat('dd-MM-yyyy  HH:mm').format(start),
                          style: TextStyle(color: Colors.white)
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
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
                            label: Text("Wijzig"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(  // END END END END END END END END END
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: Row(
                    children: <Widget>[
                      Text("Einde: ",
                          style: TextStyle(color: Colors.amber)
                      ),
                      Text(DateFormat('dd-MM-yyyy  HH:mm').format(end),
                          style: TextStyle(color: Colors.white)
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
                            label: Text("Wijzig"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: MultiSelect(
                      autovalidate: false,
                      hintText: "Druk hier om mensen toe te voegen...",
                      titleText: "Selecteer deelnemers: ",
                      errorText: 'Selecteer deelnemers: ',
                      dataSource: [
                        {
                          "display": "Arthur Joppart",
                          "value": 2,
                        },
                        {
                          "display": "Styn Toelemans",
                          "value": 1,
                        },
                        {
                          "display": "Arne Vandoorslaer",
                          "value": 3,
                        },
                        {
                          "display": "Ruben Claes",
                          "value": 4,
                        }
                      ],
                      textField: 'display',
                      valueField: 'value',
                      filterable: true,
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

                Padding(
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: pictureController,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    /*
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Dit veld mag niet leeg zijn!";
                      }
                      return null;
                    },*/
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: RaisedButton(
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
                          )
                      )
                  ),
                ),
              ],
            )
        ),
      ],

    );
  }
}