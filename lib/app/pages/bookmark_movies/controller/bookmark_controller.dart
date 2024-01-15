import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/dashboard/view/dashboard_page.dart';
import 'package:moviechallenge/app/utils/contants.dart';

class BookMarkController extends GetxController {
  bool isSort = false;
  bool isSortByDate = false;
  Box<MovieModel> box = Hive.box(Constants.bookMarkMoviesBox);
  bool isGridView = false;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  void onChangeGridView() {
    isGridView = !isGridView;
    Get.offAll(
      () => const DashBoardPage(),
      transition: Transition.fade,
    );
  }

  void showLoading() {
    isLoading = !isLoading;
    update();
  }
}
