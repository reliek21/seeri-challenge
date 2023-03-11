import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';
import 'package:seeri/models/movie_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Movie?;

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
          image: NetworkImage('https://image.tmdb.org/t/p/w500/${args?.poster_path}'),
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
            '${args?.genres}',
            style: SeeriTextStyles().smallBodyTextStyle(
              fontWeight: FontWeight.w600
            )
          ),
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
                    Container(
                      width: 66.0,
                      height: 26.0,
                      decoration: const BoxDecoration(
                        color: SeeriColors.black2,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star_rate_sharp,
                            color: SeeriColors.yellow,
                            size: 15.0,
                          ),
                          Text(
                            '6.5',
                            style: TextStyle(
                              color: SeeriColors.yellow,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    '${args?.title}',
                    style: const TextStyle(
                      color: SeeriColors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0
                    ),
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a malesuada orci. Praesent sollicitudin finibus enim. Proin a metus at magna elementum vestibulum. Maecenas dapibus pulvinar mi, et interdum metus fermentum id... Ver más',
                  style: TextStyle(
                    color: SeeriColors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0
                  ),
                ),
                const Text(
                  'Reseñas',
                  style: TextStyle(
                    color: SeeriColors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0
                  ),
                ),
                // ListView.builder(
                //   itemCount: 4,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Card(
                //       child: Row(
                //         children: [
                //           Container(),
                //           Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   Text(''),
                //                   // Todo: create a component to score of movie
                //                 ],
                //               ),
                //               Text(''),
                //               Divider()
                //             ],
                //           )
                //         ],
                //       ),
                //     );
                //   }
                // )
              ],
            ),
          ),
        )
      ],
        )
    );
  }
}