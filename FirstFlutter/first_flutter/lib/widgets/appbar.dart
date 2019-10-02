import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget  {

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage("assets/vsv1.png"),
              width: 60, height: 60,
            ),
            Text("VSV Event Manager")
          ],
        ),
      ),
      backgroundColor: Color(0xff00285A),
    );
  }
}
