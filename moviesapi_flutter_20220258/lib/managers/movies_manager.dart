import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapi_flutter_20220258/models/movie.dart';
import 'package:moviesapi_flutter_20220258/repositories/movie_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<MovieRepository>(MovieRepository(http.Client()));
}