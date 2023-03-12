import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:seeri/ui/routes/main_routes.dart';
import 'package:seeri/utils/urls_utils.dart';
import 'package:seeri/ui/widgets/carousel_slider_item_widget.dart';

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
      options: CarouselOptions(height: 150.0, viewportFraction: 0.85),
      itemCount: itemList.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, MainRoutes.movieDetail, arguments: itemList[index]),
          child: CarouselSliderItemWidget(
            imagePath: SeeriUrls.getImagePath(imagePath: itemList[index].poster_path)
          ),
        );  
      }
    );
  }
}