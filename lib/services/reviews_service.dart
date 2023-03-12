import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seeri/models/author/reviews_model.dart';

class ReviewsService {
  // Todo: pass to enviroments
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '0291d74c9f324c03b831f5098647acbf';

  Future<List<Reviews>> getReviews(movieId) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/movie/$movieId/reviews?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final reviewData = jsonData['results'] as List<dynamic>;

      final reviews = reviewData.map((reviewJson) => Reviews.fromJson(reviewJson)).toList();

      return reviews;
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
