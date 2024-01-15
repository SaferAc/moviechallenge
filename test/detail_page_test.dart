import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/movie_detail/controller/movie_detail_controller.dart';
import 'package:moviechallenge/app/utils/contants.dart';

void initHive() {
  var path = Directory.current.path;
  Hive.init('$path/test/hive_testing_path');
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  initHive();

  Future<void> setUp() async {
    Hive.registerAdapter(MovieModelAdapter());
    await Hive.openBox<MovieModel>(Constants.bookMarkMoviesBox);
  }

  Future<void> tearDown() async {
    await Hive.close();
  }

  setUpAll(() async {
    await setUp();
  });

  tearDownAll(() async {
    await tearDown();
  });

  test('onSaveMovie should add and delete movies in the box', () {
    final controller = MovieDetailController();

    // MovieModel for testing
    final testMovie = MovieModel(
      id: 1,
      title: 'Test Movie',
      posterPath: 'https://example.com/poster.jpg',
      releaseDate: DateTime(2022, 1, 1),
      genreNames: ['Action', 'Adventure'],
      voteAverage: 8.5,
      originalLanguage: 'en',
      popularity: 100.0,
      overview: 'This is a test movie.',
    );

    // onSaveMovie should add the movie to the box
    controller.onSaveMovie(testMovie);
    expect(controller.box.containsKey(testMovie.id), isTrue);

    // onSaveMovie should delete the movie from the box
    controller.onSaveMovie(testMovie);
    expect(controller.box.containsKey(testMovie.id), isFalse);
  });

  test('getIcon should return the correct icon based on box content', () {
    final controller = MovieDetailController();

    // MovieModel for testing
    final testMovie = MovieModel(
      id: 1,
      title: 'Test Movie',
      posterPath: 'https://example.com/poster.jpg',
      releaseDate: DateTime(2022, 1, 1),
      genreNames: ['Action', 'Adventure'],
      voteAverage: 8.5,
      originalLanguage: 'en',
      popularity: 100.0,
      overview: 'This is a test movie.',
    );

    // Initially, the box doesn't contain the movie, so getIcon should return a border icon
    expect(controller.getIcon(testMovie.id!),
        isA<Icon>().having((icon) => icon.color, 'color', null));

    // Add the movie to the box
    controller.onSaveMovie(testMovie);

    // Now the box contains the movie, so getIcon should return a filled icon
    expect(controller.getIcon(testMovie.id!),
        isA<Icon>().having((icon) => icon.color, 'color', Colors.red));
  });
}
