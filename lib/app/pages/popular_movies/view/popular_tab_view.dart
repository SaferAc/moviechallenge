import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/dashboard/controller/dashboard_controller.dart';
import 'package:moviechallenge/app/pages/dashboard/widgets/movie_grid_item.dart';
import 'package:moviechallenge/app/pages/dashboard/widgets/movie_list_item.dart';
import 'package:moviechallenge/app/pages/popular_movies/controller/popular_controller.dart';

class PopularTab extends StatelessWidget {
  const PopularTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(
      autoRemove: false,
      builder: (PopularController controller) {
        final dashBoardController = Get.find<DashBoardController>();
        final movieList = controller.popularMovieList;
        return Scaffold(
          backgroundColor: const Color(0xfff3f4f5),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : dashBoardController.isGridView
                  ? Obx(() => ListView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final MovieModel movieModel = movieList[index];
                          return MovieListItem(
                            index: index,
                            movieModel: movieModel,
                          );
                        },
                        itemCount: movieList.length,
                      ))
                  : Obx(() => GridView.builder(
                        controller: controller.scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final MovieModel movieModel = movieList[index];

                          return MovieGridItem(
                            index: index,
                            movieModel: movieModel,
                          );
                        },
                        itemCount: movieList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 300,
                        ),
                      )),
        );
      },
      init: PopularController(),
    );
  }
}
