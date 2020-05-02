import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_corona_go/screens/Introductory_screen.dart';
import 'package:go_corona_go/themes/dark_color.dart';
import 'package:go_corona_go/themes/theme.dart';

class SplashVirus extends StatefulWidget {
  @override
  _SplashVirusState createState() => new _SplashVirusState();
}

class _SplashVirusState extends State<SplashVirus> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => IntroductoryScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DarkColor.splashScreenColor,
      child: Stack(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
            child: Align(
              alignment: FractionalOffset.center,
              child: Image.asset(
                'images/virus_splash.gif',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('Designed & \nDeveloped by',
                        style: AppTheme.developLabel),
                    new Text('Pradosh\nShirgaonkar',
                        style: AppTheme.developLabel),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
