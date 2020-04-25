import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';
import '../models/NewsHeadline_Model.dart';

Future<List<NewsHeadline>> getNews(http.Client client) async {
  final String url = NEWS_HEADLINES;
  final response = await client.get(url);
  if (response.statusCode == 200) {
    return parseArticles(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

List<NewsHeadline> parseArticles(String responseBody) {
  final resp = jsonDecode(responseBody);
  final parsed = resp['articles'].cast<Map<String, dynamic>>();
  return parsed
      .map<NewsHeadline>((json) => NewsHeadline.fromJSON(json))
      .toList();
}
