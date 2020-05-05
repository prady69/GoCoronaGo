import 'package:flutter/material.dart';
import 'package:go_corona_go/screens/splashVirus.dart';
import 'package:go_corona_go/themes/theme.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Go Corona Go',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme.copyWith(),
        home: SplashVirus());
  }
}
