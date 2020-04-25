import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBar createState() => _CustomAppBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150);
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('d'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );
  }
}
