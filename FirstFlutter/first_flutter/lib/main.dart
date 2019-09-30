import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home : HomeScreen(),
));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(
            child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/vsv1.png"),
                    width: 60,
                    height: 60,
                  ),
                  Text("VSV Event Manager")
                ],
            ),
        ),
        backgroundColor: Color(0xff00285A),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[850],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Aangemeld als:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 5, 10),
                  child: Text(
                    "Holder Place :)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: ButtonTheme(
                  minWidth: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print("logout button pressed");
                    },
                    child: Icon(
                      Icons.exit_to_app,
                      color: Color(0xff00285A),
                      size: 30,
                    ),
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey[850],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Mijn evenementen:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2019",
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
                        child: Text("02-09-2019 tot 06-09-2019",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.amber,
            onPressed: () {
              print("open placeholder VIRINAL 2020");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Image(
                    image: AssetImage("assets/virinalsmall.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                        child: Text("Le Virinal 2020 test lange naam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 10),
                        child: Text("02-09-2020 tot 06-09-2020",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
        child: FloatingActionButton(
          onPressed: () {
            print("floating button pressed");
          },
          child: Icon(
            Icons.add,
            size: 50,
          ),
          foregroundColor: Color(0xff00285A),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}




