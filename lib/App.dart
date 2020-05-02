import 'dart:async';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_corona_go/screens/Dashboard.dart';
import 'package:go_corona_go/screens/NewsHeadlines.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/Stats.dart';
import 'themes/dark_color.dart';
import 'themes/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  AnimationController _controller;
  AnimationController _controllerChanged;
  String _activeScreen = 'Dashboard';
  Center _stateVirus;
  final _pageOptions = [Dashboard(), Stats(), ListPage()];
  final _pageNames = ['Dashboard', 'Stats', 'Top Headlines'];

  checkDataExpiry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedTime = prefs.getString('worldstats_data_expiry');
    int minsPassed = savedTime != null
        ? DateTime.now().difference(DateTime.parse(savedTime)).inMinutes
        : 30;
    if (minsPassed > 29) {
      await prefs.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();
    initialStateWidget();
    checkDataExpiry();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
      _activeScreen = _pageNames[index].toString();
    });
  }

  void initialStateWidget() {
    _stateVirus = Center(
      child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image.asset(
            'images/corona_pink.png',
            height: 200,
            width: 200,
          )),
    );
  }

  void changedStateWidget() {
    _stateVirus = Center(
      child: Image.asset(
        'images/virus_angry.png',
        height: 200,
        width: 200,
      ),
    );
    Timer(Duration(seconds: 2), () {
      setState(() {
        initialStateWidget();
      });
    });
  }

  Widget build(BuildContext context) {
//    String iconSrc = 'images/corona_pink.png';
    return Scaffold(
        backgroundColor: DarkColor.background,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: DarkColor.background,
          title: Center(child: Text(_activeScreen, style: AppTheme.titleStyle)),
          actions: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.transparent,
          highlightElevation: 0,
          onPressed: () {
            setState(() {
              changedStateWidget();
            });
          },
          child: _stateVirus,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: _selectedIndex,
          onTap: changeScreen,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: DarkColor
              .background, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: DarkColor.navigationBarItem,
                icon: Icon(
                  Icons.dashboard,
                  color: DarkColor.navigationBarItem,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: DarkColor.navigationBarItem,
                ),
                title: Text("Dashboard")),
            BubbleBottomBarItem(
                backgroundColor: DarkColor.navigationBarItem,
                icon: Icon(
                  Icons.assessment,
                  color: DarkColor.navigationBarItem,
                ),
                activeIcon: Icon(
                  Icons.assessment,
                  color: DarkColor.navigationBarItem,
                ),
                title: Text("Stats")),
            BubbleBottomBarItem(
                backgroundColor: DarkColor.navigationBarItem,
                icon: Icon(
                  Icons.subtitles,
                  color: DarkColor.navigationBarItem,
                ),
                activeIcon: Icon(
                  Icons.subtitles,
                  color: DarkColor.navigationBarItem,
                ),
                title: Text("News"))
          ],
        ),
        body: SafeArea(child: _pageOptions[_selectedIndex]));
  }
}
