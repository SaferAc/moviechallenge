import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviechallenge/app/dashboard/controller/dashboard_controller.dart';

import '../widgets/movie_grid_item.dart';
import '../widgets/movie_list_item.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (DashBoardController controller) => Scaffold(
        backgroundColor: const Color(0xfff3f4f5),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: controller.onChangeGridView,
              icon: Icon(controller.isGridView
                  ? Icons.grid_view_sharp
                  : Icons.list_sharp),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TransactionTab(
                        isSelected: controller.isUncategorized,
                        title: "Now",
                        onTap: controller.onClassifyTabChange,
                      ),
                      TransactionTab(
                        isSelected: !controller.isUncategorized,
                        title: "Current",
                        onTap: controller.onClassifyTabChange,
                      ),
                    ],
                  ),
                ],
              ),
              itemExtent: 60,
            ),
            controller.isGridView
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MovieListItem(
                          index: index,
                        );
                      },
                      childCount: 10,
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MovieGridItem(
                          index: index,
                        );
                      },
                      childCount: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                  ),
          ],
        ),
      ),
      init: DashBoardController(),
    );
  }
}

class TransactionTab extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function()? onTap;
  const TransactionTab({
    Key? key,
    this.isSelected = false,
    this.title = '',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? const Color(0xff8A9699)
                  : const Color(0xff74c947),
              width: isSelected ? 1 : 3,
            ),
          )),
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xff8A9699)
                    : const Color(0xff363f41),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRectTween extends MaterialRectCenterArcTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a, b;

  @override
  Rect lerp(double t) {
    final double myCurve = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, myCurve),
      lerpDouble(a.top, b.top, myCurve),
      lerpDouble(a.right, b.right, myCurve),
      lerpDouble(a.bottom, b.bottom, myCurve),
    );
  }

  double lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
