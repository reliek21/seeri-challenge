import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seeri/models/genre/genre_model.dart';
import 'package:seeri/models/movie/movie_model.dart';
import 'package:seeri/services/genre_service.dart';
import 'package:seeri/services/movies_service.dart';
import 'package:seeri/widgets/appbar_widget.dart';
import 'package:seeri/widgets/carousel_slider_widget.dart';
import 'package:seeri/widgets/circular_progress_widget.dart';
import 'package:seeri/widgets/filter_widget.dart';
import 'package:seeri/widgets/grid_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> _nowPlayingMovies = [];
  late List<Genre> _movieGenres = [];

  Future<void> _loadMovies() async {
    final MovieService movieService = MovieService();
    
    movieService.getNowPlayingMovies().then((movies) {
      setState(() {
        _nowPlayingMovies = movies;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  Future<void> _loadGenres() async {
    final GenreService service = GenreService();
    final List<Genre> genres = await service.getGenres();

    service.getGenres().then((genre) {
      setState(() {
        _movieGenres = genres;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
  

  @override
  void initState() {
    super.initState();
    _loadMovies();
    _loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      if (_nowPlayingMovies.isEmpty)
        const CircularProgressWidget()
      else Container(
        margin: const EdgeInsets.only(top: 24.0, bottom: 45.0),
        child: CarouselSliderWidget(itemList: _nowPlayingMovies)
      ),

      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 38.0,
        child: FilterWidget(itemList: _movieGenres)
      ),

      if(_nowPlayingMovies.isEmpty)
        const CircularProgressWidget()
      else
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 33.0, horizontal: 22.0),
            width: MediaQuery.of(context).size.width,
            child: GridMovie(itemList: _nowPlayingMovies)
          ),
        ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const AppBarWidget(title: 'Seeri-Movie'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: widgets),
      )
    );
  }
}
