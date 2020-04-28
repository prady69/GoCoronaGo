import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:go_corona_go/themes/theme.dart';

class CoronaLoader extends StatefulWidget {
  const CoronaLoader({Key key}) : super(key: key);

  @override
  _CoronaLoaderState createState() => _CoronaLoaderState();
}

class _CoronaLoaderState extends State<CoronaLoader>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
        upperBound: 1,
        lowerBound: 0);
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
        reverseCurve: Curves.bounceInOut);

    _controller.repeat(
        min: 0.6, max: 1, period: Duration(seconds: 1), reverse: true);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Center(
        child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ScaleTransition(
                      scale: _animation,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "images/corona_pink.png",
                        height: 300,
                        width: 300,
                      )),
                  new Text(
                    'Injecting Content...',
                    style: AppTheme.loadingStyle,
                  )
                ],
              ),
            )),
      ),
      color: Colors.transparent,
    );
  }
}
