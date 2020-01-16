import 'package:Cleverdivide/classes/http_service.dart';
import 'package:flutter/material.dart';
import 'package:Cleverdivide/classes/user.dart';
import 'package:Cleverdivide/classes/event.dart';

class AddParticipants extends StatefulWidget {
  @override
  _AddParticipantsState createState() => _AddParticipantsState();
}

class _AddParticipantsState extends State<AddParticipants> {
  Map data = {};
  int id;
  Event event;
  List<User> users = [];
  List<User> participants = [];

  bool initial = false;

  List<int> selected = [];

  void initSelected(){
    if (!initial){
      for(User u in participants){
        selected.add(u.getId());
      }
      initial = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    id = data['id'];
    users = data['users'];
    participants = data['participants'];

    initSelected();

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color(0xff00285A),
        title: Text("Gebruikers"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
            Navigator.pushReplacementNamed(context, '/loadingeventfromexpenseparticipants', arguments:{'id': id}),
        ),
      ),
      body: ListView(
          children: users.map((user){

            return Card(
              color: Colors.grey[800],
              child:LabeledCheckbox(
                label: '${user.name} ${user.surName}',
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                value: selected.contains(user.getId()),
                onChanged: (bool newValue) {
                  setState(() {
                    if (newValue){
                      selected.add(user.getId());
                      HttpService.addParticipant(user.getId(), this.id);
                    }else{
                      if (selected.length > 1){
                        selected.remove(user.getId());
                        HttpService.deleteParticipant(user.getId() ,this.id);
                      }
                    }
                  });
                },
              ),
            );

          }).toList(),
        ),
    );

  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}