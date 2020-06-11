import 'package:flutter/material.dart';
import 'package:go_karuna_go/App.dart';
import 'package:go_karuna_go/themes/theme.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductoryScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => App()),
    );
  }

  Widget _buildImage(String assetName) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Karuna Disease',
            style: AppTheme.coronaText,
          ),
          new Text(
            'How is it prevented?',
            style: AppTheme.coronaDescription,
          ),
          Image.asset(
            'images/$assetName.png',
            width: 300.0,
            height: 300,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      pageColor: Colors.white,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: _buildImage('1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: _buildImage('3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: _buildImage('4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: _buildImage('5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
