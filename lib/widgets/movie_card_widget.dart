import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seeri/common/colors_common.dart';

class MovieCardWidget extends StatelessWidget {
  final List<dynamic> itemList;
  final bool? disabled;

  const MovieCardWidget({
    required this.itemList,
    this.disabled,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Widget movieCard(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://image.tmdb.org/t/p/w500/${itemList[index].poster_path}')
              )
            ),
      
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0, bottom: 5.0),
            child: Text(
              itemList[index].title,
              style: const TextStyle(
                color: SeeriColors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 14.0
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                ignoreGestures: true,
                direction: Axis.horizontal,
                minRating: 1,
                itemCount: 5,
                allowHalfRating: true,
                initialRating: itemList[index].vote_average / 2,
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
              Text(
                '${itemList[index].vote_average}',
                style: const TextStyle(
                  color: SeeriColors.yellow,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0
                ),
              )
            ],
          )
        ],
      );
    }


    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 260.0,
        // mainAxisSpacing: 146.0,
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 36.0,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) => movieCard(index)
    );
  }
}