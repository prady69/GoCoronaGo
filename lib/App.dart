import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_corona_go/screens/Dashboard.dart';
import 'package:go_corona_go/screens/More.dart';
import 'package:go_corona_go/screens/NewsHeadlines.dart';

import 'screens/Stats.dart';
import 'themes/dark_color.dart';
import 'themes/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final _pageOptions = [Dashboard(), Stats(), ListPage(), More()];

  @override
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DarkColor.background,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: DarkColor.background,
          title: Text('Dashboard', style: AppTheme.titleStyle),
          actions: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: DarkColor.background),
          backgroundColor: DarkColor.infoButton,
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
                title: Text("News")),
            BubbleBottomBarItem(
                backgroundColor: DarkColor.navigationBarItem,
                icon: Icon(
                  Icons.menu,
                  color: DarkColor.navigationBarItem,
                ),
                activeIcon: Icon(
                  Icons.menu,
                  color: DarkColor.navigationBarItem,
                ),
                title: Text("Menu"))
          ],
        ),
        body: SafeArea(child: _pageOptions[_selectedIndex]));
  }
}
