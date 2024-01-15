import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/dashboard/view/dashboard_page.dart';
import 'package:moviechallenge/app/services/movie_provider.dart';

class PopularController extends GetxController {
  bool isGridView = false;
  bool isSort = false;
  bool isSortDate = false;
  RxList<MovieModel> popularMovieList = <MovieModel>[].obs;
  final movieProvider = Get.find<MovieProvider>();
  int currentPage = 1;
  int nextPage = 1;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getPopularMovies(page: currentPage);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getMoreData();
      }
    });
    super.onInit();
  }

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

  Future getPopularMovies({required int page}) async {
    double currentPosition =
        scrollController.hasClients ? scrollController.position.pixels : 0;
    showLoading();
    List<MovieModel> movies = [];
    try {
      movies = await movieProvider.getPopularMovies(page);
      popularMovieList.addAll(movies);
      popularMovieList.refresh();
    } catch (error) {
      Get.defaultDialog(title: "Error fetching data: $error");
    } finally {
      showLoading();
      update();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.jumpTo(currentPosition);
      });
    }
  }

  void getMoreData() {
    nextPage++;
    if (nextPage > currentPage) {
      getPopularMovies(page: nextPage);
      currentPage = nextPage;
    }
  }

  void sortMoviesByDate() {
    if (isSortDate) {
      popularMovieList.sort(
        (a, b) => a.releaseDate!.compareTo(b.releaseDate!),
      );
    } else {
      popularMovieList.sort(
        (b, a) => a.releaseDate!.compareTo(b.releaseDate!),
      );
    }
    isSortDate = !isSortDate;
    update();
  }

  void sortMoviesByName() {
    if (isSort) {
      popularMovieList.sort((a, b) => a.title!.compareTo(b.title!));
    } else {
      popularMovieList.sort((b, a) => a.title!.compareTo(b.title!));
    }
    isSort = !isSort;
    update();
  }
}
