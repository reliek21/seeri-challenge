import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/widgets/carousel_slider_widget.dart';
import 'package:seeri/widgets/filter_widget.dart';
import 'package:seeri/widgets/movie_card_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo: ThemeData
      backgroundColor: SeeriColors.black1,
      appBar: AppBar(
        // Todo: ThemeData
        backgroundColor: SeeriColors.black1,
        shadowColor: SeeriColors.transparent,
        title: const Text('Seeri-Movie',
            // Todo: move to TextStyles common
            style:
                TextStyle(color: SeeriColors.white, fontFamily: 'Inter', fontSize: 26.0, fontWeight: FontWeight.w600)),
        actions: const [
          Icon(Icons.account_circle, color: SeeriColors.white, size: 28.33),
          Padding(padding: EdgeInsets.only(right: 15.0))
        ],
      ),
      body: Column(
        children: [
          Container(margin: const EdgeInsets.only(top: 24.0, bottom: 45.0), child: const CarouselSliderWidget()),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 38.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const FilterWidget();
                },
              ),
            ),
          ),
          const MovieCardWidget()
        ],
      ),
    );
  }
}
