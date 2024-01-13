import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/movie_app.dart';
import 'package:moviechallenge/app/services/movie_provider.dart';

void main() async {
  Get.lazyPut(() => MovieProvider());
  runApp(const MovieApp());
}
