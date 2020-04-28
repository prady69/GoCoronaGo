import 'package:flutter/material.dart';
import 'package:go_corona_go/models/CountriesList_Model.dart';
import 'package:go_corona_go/models/CountryStats_Model.dart';
import 'package:go_corona_go/repository/countriesList_repository.dart';
import 'package:go_corona_go/themes/dark_color.dart';
import 'package:go_corona_go/themes/theme.dart';
import 'package:go_corona_go/widgets/countries_card.dart';
import 'package:go_corona_go/widgets/utilities_widgets/corona_loader.dart';
import 'package:http/http.dart' as http;

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  _StatsState();
  TextEditingController editingController = TextEditingController();
  String query = "";
  bool dataObj;
  Future<List<CountriesList>> _future;

  @override
  void initState() {
    _future = getCountries(http.Client());
    super.initState();
  }

  Card makeCard(CountriesList country) => Card(
        elevation: 0.1,
        color: DarkColor.background,
        margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Container(
          child: CountryCard(country),
        ),
      );

  Container createCountriesList(List countriesList) => Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: countriesList.length,
          itemBuilder: (BuildContext context, int index) {
            dataObj = countriesList[index]
                .country
                .toLowerCase()
                .contains(query.toLowerCase());
            if (dataObj == true) {
              return makeCard(countriesList[index]);
            }
            return Container();
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            controller: editingController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                prefixIcon: Icon(
                  Icons.search,
                  color: DarkColor.navigationBarItem,
                ),
                alignLabelWithHint: true,
                labelText: "Search by Country",
                labelStyle: TextStyle(color: DarkColor.navigationBarItem),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Container(
          child: Expanded(
            child: FutureBuilder<List<CountriesList>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? createCountriesList(snapshot.data)
                    : Center(child: CoronaLoader());
              },
            ),
          ),
        ),
      ],
    );
  }
}
