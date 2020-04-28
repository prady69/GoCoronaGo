import 'package:flutter/material.dart';
import 'package:go_corona_go/models/CountriesList_Model.dart';
import 'package:go_corona_go/models/CountryStats_Model.dart';
import 'package:go_corona_go/screens/CountryStats.dart';
import 'package:go_corona_go/themes/theme.dart';
import 'package:go_corona_go/widgets/utilities_widgets/front-arrow.dart';
import '../themes/dark_color.dart';
import 'package:random_color/random_color.dart';

class CountryCard extends StatelessWidget {
  final country;

  CountryCard(this.country);
  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    Container makeCountryList(CountriesList country, Color randomColor) =>
        Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    elevation: 8,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                          heightFactor: 0.7,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                child: new Text(
                                  'Stats from ' + country.country + ' say',
                                  style: AppTheme.titleStyle,
                                ),
                                padding: EdgeInsets.all(30),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: CountryStatsScreen(country.slug),
                              ),
                            ],
                          ));
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: new Text(
                        country.country,
                        style: AppTheme.countryTextStyle,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FrontArrow(20),
                  )
                ],
              ),
            ));

    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: DarkColor.navigationBarItem,
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DarkColor.navigationBarItem),
        child: makeCountryList(country,
            _randomColor.randomColor(colorBrightness: ColorBrightness.dark)),
      ),
    );
  }
}
