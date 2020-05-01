import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../constants.dart';
import '../models/WorldStats_Model.dart';

Future<WorldStats> getWorldStats(http.Client client) async {
  final String url = WORLD_STATS;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String prefetchedData = prefs.getString('worldstats_data');

  if (prefetchedData != null) {
    return parseWorldStats(prefetchedData);
  }

  final response = await client.get(url);
  if (response.statusCode == 200) {
    prefs.setString('worldstats_data', response.body);
    prefs.setString('worldstats_data_expiry', DateTime.now().toString());
    return parseWorldStats(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

WorldStats parseWorldStats(String responseBody) {
  final resp = jsonDecode(responseBody);
  final parsed = resp['Global'];
  return WorldStats.fromJSON(parsed);
}
