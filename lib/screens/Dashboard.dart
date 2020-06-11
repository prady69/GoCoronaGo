import 'package:flutter/material.dart';
import 'package:go_karuna_go/models/WorldStats_Model.dart';
import 'package:go_karuna_go/repository/worldStats_repository.dart';
import 'package:go_karuna_go/themes/theme.dart';
import 'package:go_karuna_go/widgets/chart_stats.dart';
import 'package:go_karuna_go/widgets/utilities_widgets/corona_loader.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _DashboardState();
  Future<WorldStats> _future;
  final title = "The Karuna";
  final description =
      "Karuna virus (Original name censored due to compliant policy) disease is an infectious disease "
      "caused by a new virus that had not been previously identified in "
      "humans. The virus causes respiratory illness (like the flu) with "
      "symptoms such as a cough, fever and in more severe cases, pneumonia.";

  @override
  void initState() {
    _future = getWorldStats(http.Client());
    super.initState();
  }

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
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: new Text(
                  'Oh ho. Looks like there was some connectivity issue. Please try again.',
                  style: AppTheme.titleStyle),
            );
          }

          return snapshot.hasData
              ? showDashboard(snapshot.data)
              : Center(child: CoronaLoader());
        },
      ),
    );
  }
}
