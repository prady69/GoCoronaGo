import 'package:flutter/material.dart';
import 'package:go_karuna_go/screens/splashVirus.dart';
import 'package:go_karuna_go/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Go Karuna Go',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme.copyWith(),
        home: SplashVirus());
  }
}
