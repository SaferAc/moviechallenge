import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/models/movie_list_model.dart';
import 'package:moviechallenge/app/utils/contants.dart';

class MovieProvider extends GetConnect {
  Future getPopularMovies(int page) async {
    final resp = await get(
      "${Constants.defaultUrl}${Constants.popularString}${Constants.pageString}$page",
      headers: Constants.defaultHeaders,
    );
    return handleResult(resp);
  }

  Future getNowPlayingMovies(int page) async {
    Response resp = await get(
      "${Constants.defaultUrl}${Constants.nowPlayingString}${Constants.pageString}$page",
      headers: Constants.defaultHeaders,
    );
    return handleResult(resp);
  }

  Future handleResult(Response resp) async {
    if (resp.statusCode == 200) {
      final movieResponse = movieListFromJson(
        jsonEncode(resp.body),
      );
      final movieList = movieResponse.results;
      return movieList;
    } else {
      return Get.defaultDialog(
          title: "Ups", content: const Text('Try Again Later'));
    }
  }
}
