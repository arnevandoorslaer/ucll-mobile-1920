import 'package:flutter/material.dart';
import 'package:Cleverdivide/classes/dueAndDebt.dart';

class ProfileInfoList extends StatefulWidget {
  final List<DueAndDebt> info;

  ProfileInfoList({this.info});

  @override
  _ProfileInfoListState createState() => _ProfileInfoListState(info: info);
}

class _ProfileInfoListState extends State<ProfileInfoList> {
  List<DueAndDebt> info;
  _ProfileInfoListState({this.info});

  @override
  Widget build(BuildContext context) {

    Column column;
    if(info.isNotEmpty){
      column = Column(
        children: info.map((event) {
          String due = "";
          String debt = "";

          if(event.due != 0){
            due = "Je moet nog " + event.due.toString() + " krijgen.";
          }
          if(event.debt != 0){
            debt = "Je moet nog  " + event.debt.toString() + " betalen.";
          }

          return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                            child: Text("${event.name}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                            child: Text(due,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                )
                            ),
                          ),Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                            child: Text(debt,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.white70, height: 20,),
              ],
          );
        }).toList(),
      );
    }
    else
      {
        TextStyle stijl = TextStyle(fontSize: 16, );
        column = Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("All set",
                style: stijl,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }

    return column;
  }
}