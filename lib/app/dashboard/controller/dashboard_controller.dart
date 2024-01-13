import 'package:get/get.dart';
import 'package:moviechallenge/app/dashboard/view/dashboard_page.dart';

class DashBoardController extends GetxController {
  bool isUncategorized = false;
  bool isGridView = false;

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
}
