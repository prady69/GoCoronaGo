import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';
import '../models/CountryStats_Model.dart';

Future<CountryStats> getCountryStats(http.Client client, String country) async {
  final String url = COUNTRY_STATS + country;
  final response = await client.get(url);
  if (response.statusCode == 200) {
    return parseCountryStats(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

CountryStats parseCountryStats(String responseBody) {
  final resp = jsonDecode(responseBody);
  final parsed = resp[resp.length - 1];
  return CountryStats.fromJSON(parsed);
}
