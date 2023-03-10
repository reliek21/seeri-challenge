import 'package:flutter/material.dart';

class CarouselSliderItemWidget extends StatelessWidget {
  final String imagePath;

  const CarouselSliderItemWidget({
    required this.imagePath,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imagePath)
          )
        ),
    );
  }
}