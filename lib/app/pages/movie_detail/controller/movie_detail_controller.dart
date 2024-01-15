import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/utils/contants.dart';

class MovieDetailController extends GetxController {
  Box<MovieModel> box = Hive.box(Constants.bookMarkMoviesBox);

  showGenres(List<String> genres) {
    String result = '';
    for (var genre in genres) {
      result += '$genre, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  void onSaveMovie(MovieModel movieModel) {
    if (box.containsKey(movieModel.id)) {
      box.delete(movieModel.id);
    } else {
      box.put(movieModel.id, movieModel);
    }
    update();
  }

  Widget getIcon(int index) {
    if (box.containsKey(index)) {
      return const Icon(Icons.favorite, color: Colors.red);
    }
    return const Icon(Icons.favorite_border);
  }
}
