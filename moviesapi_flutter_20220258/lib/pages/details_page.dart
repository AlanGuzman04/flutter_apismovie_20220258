import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi_flutter_20220258/models/results.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.results});

  final Results results;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('peliculas'),
      ),
      body: Column(),
    );
  }
}