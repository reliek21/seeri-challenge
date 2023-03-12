import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seeri/models/movie/movie_model.dart';
import 'package:seeri/routes/main_routes.dart';
import 'package:seeri/services/movies_service.dart';
import 'package:seeri/widgets/movie_card_widget.dart';

class GridMovie extends StatefulWidget {
  final List<Movie> itemList;

  // ignore: use_key_in_widget_constructors
  const GridMovie({
    required this.itemList,
  });

  @override
  State<GridMovie> createState() => _GridMovieState();
}

class _GridMovieState extends State<GridMovie> {
  late ScrollController scrollController = ScrollController();
  late List<Movie> nowPlayingMovies = [];
  late int currentPage = 1;
  late bool isLoading = false;
  late bool hasMoreMovies = true;


  Future<void> _loadMovies(int page) async {
    final MovieService movieService = MovieService();

    setState(() {
      isLoading = true;
    });

    movieService.getNowPlayingMovies(page: page).then((movies) {
      setState(() {
        nowPlayingMovies.addAll(movies);
        isLoading = false;
        if(movies.isEmpty) hasMoreMovies = false;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  void onScroll() {
    if(isLoading) return;

    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;
    final double delta = MediaQuery.of(context).size.height * 0.20;

    if(isLoading || !hasMoreMovies) return;

    if (maxScroll - currentScroll <= delta) {
      setState(() {
        currentPage++;
        isLoading = true;
      });
      _loadMovies(currentPage);
    }
  }

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = widget.itemList;
    _loadMovies(currentPage);
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(onScroll);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 260.0,
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 36.0,
        ),
        itemCount: nowPlayingMovies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, MainRoutes.movieDetail, arguments: nowPlayingMovies[index]),
            child: MovieCardWidget(itemList: nowPlayingMovies, index: index),
          );
        }
      
    );
  }
}

