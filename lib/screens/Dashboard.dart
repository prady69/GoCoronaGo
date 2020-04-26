import 'package:flutter/material.dart';
import 'package:go_corona_go/models/WorldStats_Model.dart';
import 'package:go_corona_go/repository/worldStats_repository.dart';
import 'package:go_corona_go/themes/theme.dart';
import 'package:go_corona_go/widgets/chart_stats.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _DashboardState();
  final title = "The Corona";
  final description = "Coronavirus disease (COVID-19) is an infectious disease "
      "caused by a new virus that had not been previously identified in "
      "humans. The virus causes respiratory illness (like the flu) with "
      "symptoms such as a cough, fever and in more severe cases, pneumonia.";

  Container showDashboard(WorldStats globalStats) => Container(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(title, style: AppTheme.headlineTitle),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: new Text(description),
              ),
              SizedBox(height: 40),
              new Text("Live cases worldwide", style: AppTheme.titleStyle),
              ChartStats(globalStats),
            ],
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<WorldStats>(
        future: getWorldStats(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? showDashboard(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );

    ;
  }
}
