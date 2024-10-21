import 'package:flutter/material.dart';
import 'package:yolo_test_assignment/theme.dart';

import 'movies/view/movies_page.dart';

class App extends MaterialApp {
  App({super.key})
      : super(
            home: const MoviesPage(),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData);
}
