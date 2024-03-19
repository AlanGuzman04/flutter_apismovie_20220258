import 'package:flutter/material.dart';
import 'package:moviesapi_flutter_20220258/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:moviesapi_flutter_20220258/services/api_service.dart';
import 'package:moviesapi_flutter_20220258/repositories/movie_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        Provider<MovieRepository>(create: (_) => MovieRepository(apiService: Provider.of<ApiService>(_, listen: false))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}