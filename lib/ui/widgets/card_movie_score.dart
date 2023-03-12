import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';

class CardMovieScoreWidget extends StatelessWidget {
  final double index;

  const CardMovieScoreWidget({
    required this.index,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          ignoreGestures: true,
          direction: Axis.horizontal,
          minRating: 1,
          itemCount: 5,
          allowHalfRating: true,
          initialRating: index / 2,
          itemPadding: const EdgeInsets.symmetric(horizontal: 5.21),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: SeeriColors.yellow,
          ),
          itemSize: 15.0,
          unratedColor: SeeriColors.grey,
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
        ),
        Text(index.toString(), style: SeeriTextStyles().smallBodyTextStyle(color: SeeriColors.yellow))
      ],
    );
  }
}