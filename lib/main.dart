import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/movie_app.dart';
import 'package:moviechallenge/app/services/movie_provider.dart';
import 'package:moviechallenge/app/utils/contants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>(Constants.bookMarkMoviesBox);
  Get.lazyPut(() => MovieProvider());
  runApp(const MovieApp());
}
