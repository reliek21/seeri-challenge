import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';
import 'package:seeri/models/author/reviews_model.dart';
import 'package:seeri/models/movie/movie_model.dart';
import 'package:seeri/services/reviews_service.dart';
import 'package:seeri/utils/urls_utils.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late List<Reviews> reviews = [];

  Future<void> getReviews(movieId) async {
    final ReviewsService reviewsService = ReviewsService();
    final dynamic reviews = await reviewsService.getReviews(movieId);
    
    setState(() {
      this.reviews = reviews;
    });
  }


  @override
  void initState() {
    super.initState();
    getReviews('315162');
  }
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Movie;

    Widget arrowBackIcon() {
      return Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: SeeriColors.white,
            size: 24.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      );
    }

    Widget posterPath() {
      return FlexibleSpaceBar(
        background: Image(
          fit: BoxFit.cover,
          image: NetworkImage(SeeriUrls.getImagePath(imagePath: args.poster_path ?? SeeriUrls.noImageUrl)),
        ),
      );
    }

    Widget movieGender() {
      return Container(
        width: 66.0,
        height: 26.0,
        margin: const EdgeInsets.only(right: 14.0),
        decoration: const BoxDecoration(
          color: SeeriColors.black2,
          borderRadius: BorderRadius.all(Radius.circular(6.0))
        ),
        child: Center(
          child: Text(
            '',
            // '${args?.genres[0].name',
            style: SeeriTextStyles().smallBodyTextStyle(
              fontWeight: FontWeight.w600
            )
          ),
        ),
      );
    }

    Widget score({
      bool? background,
      required String rating
    }) {
      return Container(
        width: 66.0,
        height: 26.0,
        decoration: BoxDecoration(
          color: (background == true) 
            ? SeeriColors.black2
            : SeeriColors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(6.0))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_sharp,
              color: SeeriColors.yellow,
              size: 15.0,
            ),
            Text(
              rating,
              style: SeeriTextStyles().smallBodyTextStyle(
                fontWeight: FontWeight.w600,
                color: SeeriColors.yellow
              )
            )
          ],
        ),
      );
    }

    Widget movieTitle() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          args.title,
          style: SeeriTextStyles().largeHeadingTextStyle(
            fontSize: 22.0
          ),
        ),
      );
    }

    Widget movieOverview() {
      return Text(
        args.overview,
        style: SeeriTextStyles().smallBodyTextStyle()
      );
    }

    Widget movieReviewTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 30.0, bottom: 23.0),
        child: Text(
          'Reseñas',
          style: SeeriTextStyles().subHeadingTextStyle(
            fontWeight: FontWeight.w600
          )
        ),
      );
    }
    
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 242.0,
          flexibleSpace: posterPath(),
          leading: arrowBackIcon()
        ),
        SliverToBoxAdapter(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
            height: MediaQuery.of(context).size.height,
            color: SeeriColors.black1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    movieGender(),
                    score(
                      background: true,
                      rating: '${args.vote_average}'
                    )
                  ],
                ),
                movieTitle(),
                movieOverview(),
                movieReviewTitle(),
                // Container(
                //     height: 40.0,
                //     width: 40.0,
                //     decoration: const BoxDecoration(
                //         color: SeeriColors.black2,
                //         borderRadius: BorderRadius.all(Radius.circular(100)),
                //         image: DecorationImage(
                //             image: NetworkImage(
                //                 'https://picsum.photos/seed/picsum/200/300'),
                //             fit: BoxFit.cover))),
                Expanded(
                  child: ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(reviews[index].author,
                          style: SeeriTextStyles().subHeadingTextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                          score(
                            background: false,
                            rating: '${(reviews[index].authorDetails?.avatarPath == null)}'
                          )
                        ]
                      ),
                      Text(
                        reviews[index].content,
                        style: SeeriTextStyles().smallBodyTextStyle()
                      )
                    
                    ],
                  );
                  
                    }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Divider(
                    color: SeeriColors.grey,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
        )
    );
  }
}