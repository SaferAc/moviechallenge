import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/bookmark_movies/controller/bookmark_controller.dart';
import 'package:moviechallenge/app/pages/dashboard/widgets/movie_grid_item.dart';
import 'package:moviechallenge/app/pages/dashboard/widgets/movie_list_item.dart';

class BookMarkTab extends StatelessWidget {
  const BookMarkTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookMarkController>(
      autoRemove: false,
      builder: (BookMarkController controller) {
        return Scaffold(
          backgroundColor: const Color(0xfff3f4f5),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ValueListenableBuilder(
                  valueListenable: controller.box.listenable(),
                  builder: (context, Box<MovieModel> boxModel, _) {
                    return controller.isGridView
                        ? ListView.builder(
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MovieListItem(
                                index: index,
                                movieModel: boxModel.getAt(index)!,
                              );
                            },
                            itemCount: boxModel.length,
                          )
                        : GridView.builder(
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final MovieModel movieModel =
                                  boxModel.getAt(index)!;

                              return MovieGridItem(
                                index: index,
                                movieModel: movieModel,
                              );
                            },
                            itemCount: boxModel.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 300,
                            ),
                          );
                  }),
        );
      },
      init: BookMarkController(),
    );
  }
}
