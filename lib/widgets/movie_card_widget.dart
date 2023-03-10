import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seeri/common/colors_common.dart';

// ignore: must_be_immutable
class MovieCardWidget extends StatefulWidget {
  final List<dynamic> itemList;
  late bool disabled;

  MovieCardWidget({
    required this.itemList,
    this.disabled  = false,
    super.key
  });

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    Widget movieCard(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                decoration: BoxDecoration(
                  color: SeeriColors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${widget.itemList[index].poster_path}')
                  )
                ),
      
              ),
              // Todo: this should be in another part
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.disabled = !widget.disabled;
                  });
                },
                icon: Icon(
                  widget.disabled ? Icons.favorite_border : Icons.favorite
                ),
                color: widget.disabled ? SeeriColors.white : SeeriColors.red,
                iconSize: 25.0,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0, bottom: 5.0),
            child: Text(
              widget.itemList[index].title,
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
                initialRating: widget.itemList[index].vote_average / 2,
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
                '${widget.itemList[index].vote_average}',
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
      itemCount: widget.itemList.length,
      itemBuilder: (context, index) => movieCard(index)
    );
  }
}