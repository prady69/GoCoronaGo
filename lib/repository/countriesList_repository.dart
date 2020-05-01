import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../constants.dart';
import '../models/CountriesList_Model.dart';

Future<List<CountriesList>> getCountries(http.Client client) async {
  final String url = ALL_COUNTRIES;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String prefetchedData = prefs.getString('countriesList_data');
  if (prefetchedData != null) {
    return parseCountries(prefetchedData);
  }

  final response = await client.get(url);
  if (response.statusCode == 200) {
    prefs.setString('countriesList_data', response.body);
    return parseCountries(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

List<CountriesList> parseCountries(String responseBody) {
  final resp = jsonDecode(responseBody);
  final parsed = resp.cast<Map<String, dynamic>>();
  return parsed
      .map<CountriesList>((json) => CountriesList.fromJSON(json))
      .toList();
}
