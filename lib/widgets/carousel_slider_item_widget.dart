import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

/// A widget to show an element in the carousel with image
class CarouselSliderItemWidget extends StatelessWidget {
  final String imagePath;

  const CarouselSliderItemWidget({
    required this.imagePath,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: SeeriColors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagePath)
        )
      ),
    );
  }
}