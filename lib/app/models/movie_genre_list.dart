import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], name: json['name']);
  }
}

class GenreList {
  static late List<Genre> _genres;

  GenreList._();

  static Future<void> init() async {
    String jsonString = await rootBundle.loadString('assets/movie_genres.json');
    List<dynamic> jsonList = json.decode(jsonString)['genres'];
    _genres = List<Genre>.from(
      jsonList.map(
        (json) => Genre.fromJson(json),
      ),
    );
  }

  factory GenreList() {
    return GenreList._();
  }

  List<Genre> findGenresByIds(List<int> ids) {
    return _genres.where((genre) => ids.contains(genre.id)).toList();
  }

  List<String> getGenreNamesByIds(List<int> ids) {
    List<Genre> foundGenres = findGenresByIds(ids);
    return foundGenres.map((genre) => genre.name).toList();
  }
}
