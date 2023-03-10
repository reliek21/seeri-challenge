import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/models/genre_model.dart';
import 'package:seeri/models/movie_model.dart';
import 'package:seeri/services/genre_service.dart';
import 'package:seeri/services/movies_service.dart';
import 'package:seeri/widgets/carousel_slider_widget.dart';
import 'package:seeri/widgets/circular_progress_widget.dart';
import 'package:seeri/widgets/filter_widget.dart';
import 'package:seeri/widgets/movie_card_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Movie> _movies = [];
  late List<Genre> _genres = [];
  
  final MovieService _movieService = MovieService();

  
  @override
  void initState() {
    super.initState();

    _movieService.getPopularMovies().then((movies) {
      setState(() {
        _movies = movies;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });

    _loadGenres();
  }

  Future<void> _loadGenres() async {
    final service = GenreService();
    final List<Genre> genres = await service.getGenres();

    service.getGenres().then((genre) {
      setState(() {
        _genres = genres;
        
      });
    }).catchError((error) {
      if(kDebugMode) {
        print(error);
      }
    });    
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> nonSliverWidget = [
      Column(
        children: [
          (_movies.isEmpty)
            ? const CircularProgressWidget()
            : Container(
              margin: const EdgeInsets.only(top: 24.0, bottom: 45.0), 
              child: CarouselSliderWidget(itemList: _movies)
            ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 38.0,
            child: FilterWidget(itemList: _genres)
          ),
          MovieCardWidget(
            itemList: _movies
          )
        ],
      ),
    ];


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
      body: SingleChildScrollView(
        child: Column(
          children: nonSliverWidget,
        ),
      )
    );
  }
}
