import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:moviesapi_flutter_20220258/models/movie.dart';

class ApiService {
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDI3ZDNkMmE4YzczOTNkYzYyODhlODZmN2I4MGIzZCIsInN1YiI6IjY1ZDU0MmI0MzNhMzc2MDE4Njc3OWE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHDBhxt2JI5urZHwVscj3ymoBaaTVbrIuQ67DRaOtaQ';

  static Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> moviesJson = jsonData['results'];
      return moviesJson.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}