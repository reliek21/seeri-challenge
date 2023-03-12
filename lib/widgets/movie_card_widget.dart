import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';
import 'package:seeri/models/movie/movie_model.dart';

// ignore: must_be_immutable
class MovieCardWidget extends StatefulWidget {
  final List<Movie> itemList;
  late bool isEnabled;
  final int index;

  MovieCardWidget({
    super.key,
    required this.itemList,
    this.isEnabled = false,
    required this.index,
  });


  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    final dynamic movie = widget.itemList[widget.index];

    void toggleFavorite() {
      return setState(() {
        widget.isEnabled = !widget.isEnabled;
      });
    }

    Widget movieImage() {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180.0,
            decoration: BoxDecoration(
              color: SeeriColors.grey,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    (movie.poster_path != null)
                      ? 'https://image.tmdb.org/t/p/w500/${movie.poster_path}'
                      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'
                )
              )
            ),
          ),
          IconButton(
            splashColor: SeeriColors.transparent,
            onPressed: () => toggleFavorite(),
            icon: Icon(
                widget.isEnabled ? Icons.favorite : Icons.favorite_border),
            color: widget.isEnabled ? SeeriColors.red : SeeriColors.white,
            iconSize: 25.0,
          )
        ],
      );
    }

    Widget movieTitle() {
      return Padding(
        padding: const EdgeInsets.only(top: 9.0, bottom: 5.0),
        child: Text(
          movie.title,
          style: SeeriTextStyles().smallBodyTextStyle(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget movieScore() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            ignoreGestures: true,
            direction: Axis.horizontal,
            minRating: 1,
            itemCount: 5,
            allowHalfRating: true,
            initialRating: movie.vote_average / 2,
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
          Text('${movie.vote_average}',
              style: SeeriTextStyles()
                  .smallBodyTextStyle(color: SeeriColors.yellow))
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        movieImage(),
        movieTitle(),
        movieScore()
      ],
    );
  }
}