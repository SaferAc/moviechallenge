import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/dashboard/view/dashboard_page.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Movie Challenge App',
      debugShowCheckedModeBanner: false,
      home: DashBoardPage(),
    );
  }
}
