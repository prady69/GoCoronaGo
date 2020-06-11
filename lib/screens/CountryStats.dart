import 'package:flutter/material.dart';
import 'package:go_karuna_go/models/CountryStats_Model.dart';
import 'package:go_karuna_go/repository/countryStats_repository.dart';
import 'package:go_karuna_go/themes/theme.dart';
import 'package:go_karuna_go/widgets/country_chart_stats.dart';
import 'package:go_karuna_go/widgets/utilities_widgets/corona_loader.dart';
import 'package:http/http.dart' as http;

class CountryStatsScreen extends StatefulWidget {
  @override
  _CountryStatsScreenState createState() => _CountryStatsScreenState();
  final countrySlug;
  CountryStatsScreen(this.countrySlug);
}

class _CountryStatsScreenState extends State<CountryStatsScreen> {
  Future<CountryStats> _future;

  @override
  void initState() {
    _future = getCountryStats(http.Client(), widget.countrySlug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<CountryStats>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: new Text('Data not available for selected location',
                  style: AppTheme.titleStyle),
            );
          }

          return snapshot.hasData
              ? Container(child: CountryChartStats(snapshot.data))
              : Center(child: CoronaLoader());
        },
      ),
    );
  }
}
