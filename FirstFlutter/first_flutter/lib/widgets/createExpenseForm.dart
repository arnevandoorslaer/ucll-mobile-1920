import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/widgets/multiSelect.dart';
import 'package:Cleverdivide/classes/event.dart';

class CreateExpenseForm extends StatefulWidget {
  @override
  _CreateExpenseFormState createState() => _CreateExpenseFormState();
}

class _CreateExpenseFormState extends State<CreateExpenseForm> {
  Map data = {};
  List<User> users = [];
  Event event;

  List participants = [];
  List payerId;

  List participantsMultiSelect = [];

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  DateTime start = DateTime.now(), end = DateTime.now();

  final descriptionController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    users = data['participants'];
    event = data['event'];

    List helpList = [];
    for (User p in users){
      helpList.add({"display": p.getName(), "value": p.getId()});
    }
    participantsMultiSelect = helpList;

    return ListView(
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(// OMSCHRIJVING-----------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: descriptionController,
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
                      labelText: 'Omschrijving: ',
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

                Padding(// AMOUNT-----------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,0,10,10),
                  child: TextFormField(
                    controller: amountController,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Dit veld mag niet leeg zijn!";
                      }
                      else if (!new RegExp("^[0-9]*[.,]?[0-9]*\$").hasMatch(value) || !value.contains(new RegExp("[0-9]"))) {
                        return "Incorrecte waarde voor bedrag";
                      }
                      else if (double.parse(value) > 9000) {
                        return "It's over 9000!";
                      }
                      return null;
                    },
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter(RegExp("[0-9.,]")),
                    ],
                    decoration: InputDecoration(
                      labelText:"Bedrag: ",
                      //hintText: "69.0",
                      labelStyle: TextStyle(
                      color: Colors.amber,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)
                    ),
                    )
                  ),
                ),

                Padding( // PARTICIPANTS----------------------------------------
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: MultiSelect(
                    autovalidate: false,
                    hintText: "Druk hier om deelnemers toe te voegen...",
                    titleText: "Selecteer deelnemers: ",
                    errorText: 'Selecteer deelnemers: ',
                    validator: (value) {
                      if (value == null) {
                        return 'Gelieve een of meer deelnemers te selecteren';
                      }
                    },
                    dataSource: this.participantsMultiSelect,
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

                Padding( // PAYER-----------------------------------------------
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: MultiSelect(
                    autovalidate: false,
                    hintText: "Druk hier om de betaler toe te voegen...",
                    titleText: "Selecteer betaler: ",
                    validator: (value) {
                      if (value == null) {
                        return "Gelieve een betaler te selecteren!";
                      }
                      List<String> g = value.toString().split(" ");
                      if(g.length > 1){
                        return "Er kan maar 1 betaler zijn!";
                      }
                    },
                    errorText: 'Selecteer betaler: ',
                    dataSource: this.participantsMultiSelect,
                    textField: 'display',
                    valueField: 'value',
                    required: true,
                    value: payerId,
                    onSaved: (value) {
                      if (value == null) return;
                      setState(() {
                        payerId = value;
                      });
                    },
                  ),
                ),

                Padding( // ADD BUTTON----------------------------------------
                  padding: const EdgeInsets.fromLTRB(10,10,10,0),
                  child:
                  RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Uitgave wordt toegevoegd...')));

                        HttpService.addExpense(participants, payerId.first, double.tryParse(amountController.text), event.eventId, descriptionController.text)
                            .then((bool result) {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/loadingeventfromexpenseparticipants', arguments:{'id':event.getEventId()});
                        });
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