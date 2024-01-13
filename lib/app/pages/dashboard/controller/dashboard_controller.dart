import 'package:get/get.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/pages/dashboard/view/dashboard_page.dart';
import 'package:moviechallenge/app/services/movie_provider.dart';

class DashBoardController extends GetxController {
  bool isUncategorized = false;
  bool isGridView = false;
  List<MovieModel> movieList = [];
  final movieProvider = Get.find<MovieProvider>();
  int page = 1;

  @override
  void onInit() {
    getNowPlayingMovies(page: page);
    super.onInit();
  }

  void onClassifyTabChange() {
    isUncategorized = !isUncategorized;
    update();
  }

  void onChangeGridView() {
    isGridView = !isGridView;
    Get.offAll(
      () => const DashBoardPage(),
      transition: Transition.fade,
    );
  }

  Future getNowPlayingMovies({required int page}) async {
    final movies = await movieProvider.getNowPlayingMovies(page);
    movieList.addAll(movies);
    update();
    print(movieList);
  }
}
