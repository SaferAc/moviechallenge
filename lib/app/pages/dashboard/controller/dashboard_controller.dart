import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/pages/dashboard/view/dashboard_page.dart';
import 'package:moviechallenge/app/pages/now_playing_movies/controller/now_playing_controller.dart';
import 'package:moviechallenge/app/pages/popular_movies/controller/popular_controller.dart';

class DashBoardController extends GetxController
    with GetTickerProviderStateMixin {
  bool isGridView = false;
  late TabController tabBarController;
  int currentTab = 0;

  @override
  void onInit() {
    tabBarController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void onChangeGridView() {
    isGridView = !isGridView;
    update();
    Get.offAll(() => const DashBoardPage());
  }

  onTabChange(int current) {
    currentTab = current;
    update();
  }

  void onSortMovies() {
    switch (currentTab) {
      case 0:
        final popularController = Get.put(PopularController());
        popularController.sortMoviesByDate();
      case 1:
        final nowPlayingController = Get.put(NowPlayingController());
        nowPlayingController.sortMoviesByDate();
    }
  }

  void sortMoviesByName() {
    switch (currentTab) {
      case 0:
        final popularController = Get.put(PopularController());
        popularController.sortMoviesByName();
      case 1:
        final nowPlayingController = Get.put(NowPlayingController());
        nowPlayingController.sortMoviesByName();
    }
  }
}
