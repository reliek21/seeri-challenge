// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      poster_path: json['poster_path'] as String?,
      vote_average: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      genre: (json['genre'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.poster_path,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'genre': instance.genre,
    };
