// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';
import 'package:seeri/models/genre/genre_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String? poster_path;
  final double vote_average;
  final String overview;
  final List<Genre>? genre;

  Movie({
    required this.id,
    required this.title,
    this.poster_path,
    required this.vote_average,
    required this.overview,
    this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  get genres =>  genre?.map((e) => Genre(id: e.id, name: e.name)).toList();

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}