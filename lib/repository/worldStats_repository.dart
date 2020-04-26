import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';
import '../models/WorldStats_Model.dart';

Future<WorldStats> getWorldStats(http.Client client) async {
  final String url = WORLD_STATS;
  final response = await client.get(url);
  if (response.statusCode == 200) {
    return parseWorldStats(response.body);
//    return parseWorldStats(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

WorldStats parseWorldStats(String responseBody) {
  final resp = jsonDecode(responseBody);
  final parsed = resp['Global'];
  print("print");
  print(WorldStats.fromJSON(parsed));
  return WorldStats.fromJSON(parsed);
//  return parsed.map<WorldStats>((json) => WorldStats.fromJSON(json));
}
