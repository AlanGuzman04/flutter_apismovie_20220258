import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;



// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'popular.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'popular.g.dart';


const _apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDI3ZDNkMmE4YzczOTNkYzYyODhlODZmN2I4MGIzZCIsInN1YiI6IjY1ZDU0MmI0MzNhMzc2MDE4Njc3OWE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FHDBhxt2JI5urZHwVscj3ymoBaaTVbrIuQ67DRaOtaQ'; // Reemplaza esto con tu API key

Future<Popular> fetchpopularmovies() async {
  
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
  
  headers: {
      'Authorization': 'Bearer $_apiKey'
    },
    
  
  );


 
 if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> movieList = jsonData['results']; 
    final Map<String, dynamic> movieData = movieList[0];
    return Popular.fromJson(movieData);
    
  } else {
    
    throw Exception('Failed to load character');
  }
}


@HiveType(typeId: 0)
@freezed
class Popular with _$Popular {
  const factory Popular({
    @HiveField(0) @JsonKey(name: "page") required int page,
    @HiveField(1) @JsonKey(name: "results") required List<Object> results,
    @HiveField(2) @JsonKey(name: "total_pages") required int total_pages,
    @HiveField(3) @JsonKey(name: "total_results") required int total_results,
  }) = _Popular;

  factory Popular.fromJson(Map<String, Object?> json)
      => _$PopularFromJson(json);

}