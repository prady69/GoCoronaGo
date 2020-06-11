import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_karuna_go/themes/dark_color.dart';

class FrontArrow extends StatelessWidget {
  final double sizeGiven;
  const FrontArrow(this.sizeGiven);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Icon(
        Icons.arrow_forward,
        color: DarkColor.background,
        size: sizeGiven,
      ),
      color: Colors.transparent,
    );
  }
}
