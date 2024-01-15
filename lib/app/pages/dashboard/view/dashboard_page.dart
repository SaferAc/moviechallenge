import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/pages/bookmark_movies/view/bookmark_tab_view.dart';
import 'package:moviechallenge/app/pages/dashboard/controller/dashboard_controller.dart';
import 'package:moviechallenge/app/pages/now_playing_movies/view/now_playing_tab_view.dart';
import 'package:moviechallenge/app/pages/popular_movies/view/popular_tab_view.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      autoRemove: false,
      builder: (DashBoardController controller) {
        return Scaffold(
            backgroundColor: const Color(0xfff3f4f5),
            appBar: AppBar(
              title: const Text('Movies App'),
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: controller.onChangeGridView,
                  icon: Icon(controller.isGridView
                      ? Icons.grid_view_sharp
                      : Icons.list_sharp),
                ),
                IconButton(
                  onPressed: controller.onSortMovies,
                  icon: const Icon(Icons.sort),
                ),
                IconButton(
                  onPressed: controller.sortMoviesByName,
                  icon: const Icon(Icons.sort_by_alpha),
                ),
              ],
              bottom: TabBar(
                controller: controller.tabBarController,
                tabs: const [
                  Tab(
                    text: "Popular",
                  ),
                  Tab(
                    text: "Now Playing",
                  ),
                  Tab(
                    text: "Saved",
                  )
                ],
                onTap: controller.onTabChange,
              ),
            ),
            body: TabBarView(
              controller: controller.tabBarController,
              children: const [
                PopularTab(),
                NowPlayingTab(),
                BookMarkTab(),
              ],
            ));
      },
      init: DashBoardController(),
    );
  }
}
