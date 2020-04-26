import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../themes/dark_color.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  List navigationRoutes = ['/', '/stats', '/news', '/more'];

  @override
  void initState() {
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pushNamed(context, navigationRoutes[currentIndex]);
  }

  Widget build(BuildContext context) {
    return BubbleBottomBar(
//      backgroundColor: DarkColor.navigationBar,
      opacity: .2,
      currentIndex: currentIndex,
      onTap: changeScreen,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end, //new
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor:
          DarkColor.background, //optional, uses theme color if not specified
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
            title: Text(currentIndex.toString())),
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
    );
  }
}
