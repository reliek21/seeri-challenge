// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String poster_path;
  final double vote_average;

  Movie({
    required this.id,
    required this.title,
    required this.poster_path,
    required this.vote_average,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}