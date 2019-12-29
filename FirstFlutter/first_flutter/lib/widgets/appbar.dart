import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget  {

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  final String text;
  CustomAppBarWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Event Manager"),
      backgroundColor: Color(0xff00285A),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        )
      ],
    );
  }
}
