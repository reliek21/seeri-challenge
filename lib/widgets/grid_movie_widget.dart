import 'package:flutter/material.dart';
import 'package:seeri/models/movie_model.dart';
import 'package:seeri/widgets/movie_card_widget.dart';

class GridMovie extends StatefulWidget {
  final List<Movie> itemList;

  const GridMovie({
    required this.itemList,
    super.key
  });

  @override
  State<GridMovie> createState() => _GridMovieState();
}

class _GridMovieState extends State<GridMovie> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 260.0,
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 36.0,
      ),
      itemCount: widget.itemList.length,
      itemBuilder: (context, index) => MovieCardWidget(
        itemList: widget.itemList,
        index: index,
      )
    );
  }
}