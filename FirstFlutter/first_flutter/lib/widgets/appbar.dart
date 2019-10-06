import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget  {

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  final String text;
  CustomAppBarWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$text"),
      backgroundColor: Color(0xff00285A),
    );
  }
}
