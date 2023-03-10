import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final int itemCount;
  final List<dynamic> itemList;

  const CarouselSliderWidget({
    required this.itemCount,
    required this.itemList,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 0.85
      ),
      itemCount: itemCount,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://image.tmdb.org/t/p/w500/${itemList[index].poster_path}')
            )
          ),
        );  
      }
    );
  }
}