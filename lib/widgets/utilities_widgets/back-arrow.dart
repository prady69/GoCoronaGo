import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_karuna_go/themes/dark_color.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Icon(
        Icons.arrow_back,
        color: DarkColor.iconColor,
        size: 30,
      ),
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: Colors.white)),
    );
  }
}
