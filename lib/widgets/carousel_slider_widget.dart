import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:seeri/widgets/carousel_slider_item_widget.dart';

/// Carousel to show images of now playing movies
class CarouselSliderWidget extends StatelessWidget {
  final List<dynamic> itemList;

  const CarouselSliderWidget({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 0.85
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselSliderItemWidget(
          imagePath: 'https://image.tmdb.org/t/p/w500/${itemList[index].poster_path}'
        );  
      }
    );
  }
}