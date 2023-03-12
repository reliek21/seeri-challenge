import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/ui/routes/main_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: SeeriColors.black1),
      title: 'Seeri Movies',
      initialRoute: MainRoutes.home,
      routes: movieRoutes(),
    );
  }
}