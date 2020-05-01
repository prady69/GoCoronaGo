import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:go_corona_go/models/CountryStats_Model.dart';
import 'package:go_corona_go/themes/dark_color.dart';
import 'package:go_corona_go/themes/theme.dart';
import 'package:intl/intl.dart';

class CountryChartStats extends StatefulWidget {
  final CountryStats globalStats;
  const CountryChartStats(this.globalStats);
  @override
  _CountryChartStatsState createState() => _CountryChartStatsState();
}

class _CountryChartStatsState extends State<CountryChartStats> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> getChartData(CountryStats stats) {
    return <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(stats.confirmed.toDouble(), DarkColor.active,
              rankKey: 'Active'),
          new CircularSegmentEntry(
              stats.recovered.toDouble(), DarkColor.recovered,
              rankKey: 'Recovered'),
          new CircularSegmentEntry(stats.deaths.toDouble(), DarkColor.death,
              rankKey: 'Death'),
        ],
        rankKey: 'Covid19 Stats',
      ),
    ];
  }

//  List<CircularStackEntry> data = ;

  @override
  Widget build(BuildContext context) {
    final stats = widget.globalStats;
    final recoveredCases = NumberFormat.compact().format(stats.recovered);
    final deathCases = NumberFormat.compact().format(stats.deaths);
    final confirmedCases = NumberFormat.compact().format(stats.confirmed);
    final activeCases = NumberFormat.compact()
        .format(stats.confirmed - stats.deaths - stats.recovered);

    return Column(
      children: <Widget>[
        new AnimatedCircularChart(
          key: _chartKey,
          size: const Size(250.0, 250.0),
          initialChartData: getChartData(stats),
          chartType: CircularChartType.Pie,
          edgeStyle: SegmentEdgeStyle.round,
          duration: Duration(milliseconds: 1000),
          labelStyle: AppTheme.subTitleStyle,
        ),
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Total Cases:',
                  style: AppTheme.totalConfirmedCasesLabel,
                ),
                new Text(confirmedCases.toString(),
                    style: AppTheme.statsCountNumber
                        .copyWith(color: DarkColor.confirmedCasesBox)),
              ]),
        ),
        Card(
            elevation: 6.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                color: DarkColor.background,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Table(
                  children: [
                    TableRow(children: [
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.radio_button_checked,
                            color: DarkColor.active,
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(-5.0, 1.0, 0.0),
                            child: new Text(
                              'Active',
                              style: AppTheme.legendsStyle.copyWith(
                                  backgroundColor: DarkColor.active,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.radio_button_checked,
                            color: DarkColor.death,
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(-5.0, 1.0, 0.0),
                            child: new Text(
                              'Death',
                              style: AppTheme.legendsStyle.copyWith(
                                  backgroundColor: DarkColor.death,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.radio_button_checked,
                            color: DarkColor.recovered,
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(-5.0, 1.0, 0.0),
                            child: new Text(
                              'Recovered',
                              style: AppTheme.legendsStyle.copyWith(
                                  backgroundColor: DarkColor.recovered,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          activeCases.toString(),
                          style: AppTheme.statsCountNumber
                              .copyWith(color: DarkColor.active),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          deathCases.toString(),
                          style: AppTheme.statsCountNumber
                              .copyWith(color: DarkColor.death),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(recoveredCases.toString(),
                            style: AppTheme.statsCountNumber
                                .copyWith(color: DarkColor.recovered)),
                      ),
                    ])
                  ],
                ))),
      ],
    );
  }
}
