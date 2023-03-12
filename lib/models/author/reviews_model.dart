// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';
import 'package:seeri/models/author/author_model.dart';

part 'reviews_model.g.dart';

@JsonSerializable()
class Reviews {
  final String id;
  final String author;
  final String content;
  final Author? authorDetails;

  Reviews({
    required this.id,
    required this.author,
    required this.content,
    required this.authorDetails,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);  
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
