import 'package:flutter/material.dart';
import 'package:seeri/screens/home_screen.dart';
import 'package:seeri/screens/movie_details_screen.dart';

class MainRouteParams {
  static const String movieId = 'movieId';
}

class MainRoutes {
  MainRoutes._();

  static const String home = '/';
  static const String movieDetail = '/detail';
}

Map<String, WidgetBuilder> movieRoutes() {
  return <String, WidgetBuilder> {
    MainRoutes.home: (BuildContext context) => const HomeScreen(),
    MainRoutes.movieDetail: (BuildContext context) => const MovieDetailsScreen()
  };
}