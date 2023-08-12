import 'dart:convert';

import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/model/movieModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.api_key}';

  Future<List<MovieModel>> getTrendingApi() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodeJson = json.decode(response.body)['results'] as List;
      return decodeJson.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('No data');
    }
  }

  static const topRating =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key}";
  Future<List<MovieModel>> getTopRating() async {
    final response = await http.get(Uri.parse(topRating));
    if (response.statusCode == 200) {
      final decodeJson = json.decode(response.body)['results'] as List;
      return decodeJson.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('No data');
    }
  }

  static const upcomingd =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.api_key}";
  Future<List<MovieModel>> getUpcoming() async {
    final response = await http.get(Uri.parse(upcomingd));
    if (response.statusCode == 200) {
      final decodeJson = json.decode(response.body)['results'] as List;
      return decodeJson.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('No data');
    }
  }
}
