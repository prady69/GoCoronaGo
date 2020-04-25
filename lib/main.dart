import 'package:flutter/material.dart';
import 'package:go_corona_go/themes/theme.dart';

import 'App.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Go Corona Go',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme.copyWith(),
        home: App());
  }
}
