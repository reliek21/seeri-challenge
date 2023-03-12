// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      authorDetails: json['authorDetails'] == null
          ? null
          : Author.fromJson(json['authorDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'authorDetails': instance.authorDetails,
    };
