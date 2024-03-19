import 'package:flutter/material.dart';
import 'package:moviesapi_flutter_20220258/models/movie.dart';
import 'package:provider/provider.dart';
import 'package:moviesapi_flutter_20220258/services/api_service.dart';
import 'package:moviesapi_flutter_20220258/repositories/movie_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieRepository = Provider.of<MovieRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movieRepository.fetchPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network('https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}'),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].overview),
                );
              },
            );
          }
        },
      ),
    );
  }
}