// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class Author {
  final String name;
  final String username;
  final String? avatarPath;
  final double? rating;

  Author({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
