import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';
import 'package:seeri/models/movie/movie_model.dart';
import 'package:seeri/utils/urls_utils.dart';
import 'package:seeri/ui/widgets/favorite_bottom_widget.dart';

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
                      ? SeeriUrls.getImagePath(imagePath: movie.poster_path)
                      : SeeriUrls.noImageUrl
                )
              )
            ),
          ),
          FavoriteBottomWidget(
            color: widget.isEnabled ? SeeriColors.red : SeeriColors.white,
            icon: Icon(widget.isEnabled ? Icons.favorite : Icons.favorite_border),
            onPress: toggleFavorite
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        movieImage(),
        movieTitle(),
        
      ],
    );
  }
}