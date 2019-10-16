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

  final _formKey = GlobalKey<FormState>();
  DateTime start = DateTime.now(), end = DateTime.now();

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
                                      print(start);
                                    });
                                  },
                                  onConfirm: (date) {
                                    setState(() {
                                      this.start = date;
                                      print(start);
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
                                      print(end);
                                    });
                                  },
                                  onConfirm: (date) {
                                    setState(() {
                                      this.end = date;
                                      print(end);
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
                          "value": "BelgianNoise",
                        },
                        {
                          "display": "Styn Toelemans",
                          "value": "Lemonade",
                        },
                        {
                          "display": "Arne Vandoorslaer",
                          "value": "ArneFPS",
                        },
                        {
                          "display": "Guy Spenge De Wit",
                          "value": "Spenge",
                        }
                      ],
                      textField: 'display',
                      valueField: 'value',
                      filterable: true,
                      required: true,
                      value: null,
                      onSaved: (value) {
                        print('The value is $value');
                      }
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          Scaffold.of(context).
                          showSnackBar(SnackBar(content: Text('Processing Data')));
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
