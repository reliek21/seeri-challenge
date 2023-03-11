import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seeri/models/movie_model.dart';

class MovieService {
  // Todo: pass to enviroments
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '0291d74c9f324c03b831f5098647acbf';

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey'));
  
    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final movieData = jsonData['results'] as List;

      final movie = movieData.map((movie) => Movie.fromJson(movie)).toList();
      return movie;
    } else {
      throw Exception('Failed to load now movies');
    }
  }
}