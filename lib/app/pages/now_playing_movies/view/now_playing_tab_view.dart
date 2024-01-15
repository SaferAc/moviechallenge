import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/commons/widgets/movie_grid_item.dart';
import 'package:moviechallenge/app/commons/widgets/movie_list_item.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/dashboard/controller/dashboard_controller.dart';
import 'package:moviechallenge/app/pages/now_playing_movies/controller/now_playing_controller.dart';

class NowPlayingTab extends StatelessWidget {
  const NowPlayingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NowPlayingController>(
      autoRemove: false,
      builder: (NowPlayingController controller) {
        final dashBoardController = Get.find<DashBoardController>();
        final movieList = controller.nowPlayingMovieList;
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
      init: NowPlayingController(),
    );
  }
}
