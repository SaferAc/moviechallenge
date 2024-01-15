import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/pages/dashboard/controller/dashboard_controller.dart';

void main() {
  group('DashboardController Tests', () {
    late DashBoardController dashBoardController;

    setUp(() {
      Get.testMode = true;
      dashBoardController = DashBoardController();
      dashBoardController.onInit();
    });

    test('Initial values are set correctly', () {
      expect(dashBoardController.isGridView, false);
      expect(dashBoardController.tabBarController.index, 0);
      expect(dashBoardController.currentTab, 0);
    });

    test('Toggle GridView updates state', () {
      expect(dashBoardController.isGridView, false);

      dashBoardController.onChangeGridView();

      expect(dashBoardController.isGridView, true);
    });

    test('Tab change updates currentTab', () {
      expect(dashBoardController.currentTab, 0);

      dashBoardController.onTabChange(1);

      expect(dashBoardController.currentTab, 1);
    });
  });
}
