import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapi_flutter_20220258/models/movie.dart';
import 'package:moviesapi_flutter_20220258/services/api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository({required this.apiService});

  Future<List<Movie>> fetchPopularMovies() async {
    final http.Response response = await apiService.fetchPopularMovies(); 

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic>? moviesJson = jsonData['results'];
      if (moviesJson != null) {
        return moviesJson.map((movieJson) => Movie.fromJson(movieJson)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}