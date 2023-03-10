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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> _popularMovies = [];
  late List<Movie> _topRatedMovies = [];
  late List<Genre> _genres = [];

  final MovieService _movieService = MovieService();

  @override
  void initState() {
    super.initState();

    _movieService.getPopularMovies().then((movies) {
      setState(() {
        _popularMovies = movies;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });

    _movieService.getTopratedMovies().then((movies) {
      setState(() {
        _topRatedMovies = movies;
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
      if (kDebugMode) {
        print(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      if (_popularMovies.isEmpty)
        const CircularProgressWidget()
      else Container(
        margin: const EdgeInsets.only(top: 24.0, bottom: 45.0),
        child: CarouselSliderWidget(itemList: _popularMovies)
      ),

      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 38.0,
        child: FilterWidget(itemList: _genres)
      ),

      if(_topRatedMovies.isEmpty)
        const CircularProgressWidget()
      else
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 31.0, horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: MovieCardWidget(itemList: _topRatedMovies)
          ),
        ),
    ];

    AppBar appBar() {
      return AppBar(
        // Todo: ThemeData
        backgroundColor: SeeriColors.black1,
        shadowColor: SeeriColors.transparent,
        title: const Text('Seeri-Movie',
          // Todo: move to TextStyles common
          style: TextStyle(
            color: SeeriColors.white,
            fontFamily: 'Inter',
            fontSize: 26.0,
            fontWeight: FontWeight.w600
          )
        ),
        actions: const [
          Icon(
            Icons.account_circle,
            color: SeeriColors.white,
            size: 28.33
          ),
          Padding(padding: EdgeInsets.only(right: 15.0))
        ],
      );
    }

    return Scaffold(
      // Todo: ThemeData
      backgroundColor: SeeriColors.black1,
      appBar: appBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(children: widgets),
      )
    );
  }
}
