import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seeri/models/genre/genre_model.dart';
import 'package:seeri/models/movie/movie_model.dart';
import 'package:seeri/ui/routes/main_routes.dart';
import 'package:seeri/services/genre_service.dart';
import 'package:seeri/services/movies_service.dart';
import 'package:seeri/ui/widgets/appbar_widget.dart';
import 'package:seeri/ui/widgets/bottom_navigation_widget.dart';
import 'package:seeri/ui/widgets/carousel_slider_widget.dart';
import 'package:seeri/ui/widgets/circular_progress_widget.dart';
import 'package:seeri/ui/widgets/filter_widget.dart';
import 'package:seeri/ui/widgets/grid_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedIndex = 0;
  late List<Movie> _nowPlayingMovies = [];
  late List<Genre> _movieGenres = [];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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

      if(_movieGenres.isEmpty)
        Container()
      else SizedBox(
        height: 38.0,
        width: MediaQuery.of(context).size.width,
        child: FilterWidget(itemList: _movieGenres)
      ),

      if(_nowPlayingMovies.isEmpty)
        const CircularProgressWidget()
      else
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 22.0),
            width: MediaQuery.of(context).size.width,
            child: GridMovie(itemList: _nowPlayingMovies)
          ),
        ),
    ];

    List<BottomNavigationBarItem> navigationItems = const  <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const AppBarWidget(title: 'Seeri-Movie'),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: widgets),
        ),
      ),
      bottomNavigationBar: ButtonNavigationWidget(
        selectedIndex: selectedIndex,
        navigationItems: navigationItems,
        itemRoutes: const [MainRoutes.home],
      )
    );
  }
}
