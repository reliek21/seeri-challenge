import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seeri/models/genre_model.dart';

class GenreService {
  // Todo: pass to enviroments
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '0291d74c9f324c03b831f5098647acbf';

  Future<List<Genre>> getGenres() async {
    final response = await http.get(Uri.parse('$_baseUrl/genre/movie/list?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> genresData = responseData['genres']; 
      final List<Genre> genres = genresData.map((genresData) => Genre.fromJson(genresData)).toList();
      
      return genres;
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
